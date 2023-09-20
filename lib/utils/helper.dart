import 'package:hr_emp_proj/utils/extension_methods.dart';

class Helper{
  static calculateWorkingHours({String? startTime, String? endTime, String? date}){
    var difference = '${date ?? ''} ${startTime ?? ''}'.difference('${date ?? ''} ${endTime ?? ''}');
    return '${difference.inHours}: ${(difference.inMinutes % 60).toString().padLeft(2,'0')}';
  }
}