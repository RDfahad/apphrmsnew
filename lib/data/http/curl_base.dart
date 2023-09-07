import 'dart:convert';
import 'dart:core';
enum Platform { win, posix }

final _r1 = RegExp(r'"');
final _r2 = RegExp(r'%');
final _r3 = RegExp(r'\\');
final _r4 = RegExp(r'[\r\n]+');
final _r5 = RegExp(r"[^\x20-\x7E]|'");
final _r7 = RegExp(r"'");
final _r8 = RegExp(r'\n');
final _r9 = RegExp(r'\r');
final _r10 = RegExp(r'[[{}\]]');
const _urlencoded = 'application/x-www-form-urlencoded';
const _multipartFormData = 'multipart/form-data';

String _escapeStringWindows(String str) =>
    '"${str.replaceAll(_r1, '""').replaceAll(_r2, '"%"').replaceAll(_r3, '\\\\').replaceAllMapped(_r4, (match) => '"^${match.group(0)}"')}"';

String _escapeStringPosix(String str) {
  if (_r5.hasMatch(str)) {
    // Use ANSI-C quoting syntax.
    return "\$'${str.replaceAll(_r3, '\\\\').replaceAll(_r7, "\\'").replaceAll(_r8, '\\n').replaceAll(_r9, '\\r').replaceAllMapped(_r5, (Match match) {
      var x = match.group(0);
      assert(x?.length == 1);
      final code = x?.codeUnitAt(0);
      if (code! < 256) {
        // Add leading zero when needed to not care about the next character.
        return code < 16
            ? '\\x0${code.toRadixString(16)}'
            : '\\x${code.toRadixString(16)}';
      }
      final c = code.toRadixString(16);
      return '\\u${('0000$c').substring(c.length, c.length + 4)}';
    })}'";
  } else {
    // Use single quote syntax.
    return "'$str'";
  }
}

String toCurl(MappedRequest req, {Platform platform = Platform.posix}) {
  try {
    var command = ['curl'];
    var ignoredHeaders = ['host', 'method', 'path', 'scheme', 'version'];
    final escapeString =
    platform == Platform.win ? _escapeStringWindows : _escapeStringPosix;
    var requestMethod = 'GET';
    var data = <String>[];
    final requestHeaders = req.headers ?? {};
    final contentType = requestHeaders['content-type'];
    var queryParameters = "";

    if (req.queryParameters != null && req.queryParameters!.isNotEmpty) {
      queryParameters += "?";
      for (var i = 0; i < req.queryParameters!.length; i++) {
        String? key = req.queryParameters?.keys.elementAt(i);
        String value = req.queryParameters?.values.elementAt(i);
        queryParameters += "$key=$value";

        if (i != req.queryParameters!.length - 1) {
          queryParameters += "&";
        }
      }
    }

    command.add(escapeString('${req.url}$queryParameters')
        .replaceAllMapped(_r10, (match) => '\\${match.group(0)}'));
    if (contentType != null && contentType.indexOf(_urlencoded) == 0) {
      ignoredHeaders.add('content-length');
      requestMethod = 'POST';
      data.add('--data-urlencode');
      if (req.body != null) {
        data.add(req.body.keys
            .map((key) => '\'$key=${(req.body[key].toString())}\'')
            .join(' --data-urlencode '));
      }
    } else if (contentType != null &&
        contentType.indexOf(_multipartFormData) == 0) {
      ignoredHeaders.add('content-length');
      // requestMethod = 'POST';
      data.add('--form');
      if (req.body != null) {
        data.add(req.body.fields
            .map((field) => '\'${field.key}=${(field.value.toString())}\'')
            .join(' --form '));
        if (req.body.files?.length ?? 0 > 0) {
          data.add(' --form ');
          data.add(req.body.files
              .map((file) => '\'${file.key}=@${(file.value.path.toString())}\'')
              .join(' --form '));
        }
      }
    } else if (req.body?.isNotEmpty ?? false) {
      final requestBody = req.body == null ? null : json.encode(req.body);
      ignoredHeaders.add('content-length');
      requestMethod = 'POST';
      data.add('--data-raw');
      data.add(escapeString(requestBody!));
    }

    if (req.method != requestMethod) {
      if (req.method != null) {
        command
          ..add('-X')
          ..add(req.method!);
      }
    }
    Map<String, String>.fromIterable(
        requestHeaders.keys.where((k) => !ignoredHeaders.contains(k)),
        value: (k) => requestHeaders[k]).forEach((k, v) {
      if (k == "content-type") {
        var split = v.split(";");
        v = split[0];
      }
      command
        ..add('-H')
        ..add(escapeString('$k: $v'));
    });
    return (command
      ..addAll(data)
      ..add('--compressed')
      ..add('--insecure'))
        .join(' ');
  } catch (e) {
    return "Curl Exception: $e";
  }
}

class MappedRequest {
  String? url, method;
  dynamic body;
  Map<String, dynamic>? headers, queryParameters;

  MappedRequest({
    this.url,
    this.method,
    this.body,
    this.headers,
    this.queryParameters,
  });
}
