
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

import '../constants.dart';

class LocalAuthenticationService {
  LocalAuthentication? auth;
  bool _canCheckBiometrics = false;
  String authorized = 'Not Authorized';
  bool isAuthenticating = false;

  //creating instance
  LocalAuthenticationService() {
    auth = LocalAuthentication();
  }

  // Returns true if device is capable of checking biometrics.
  Future<bool> checkBiometrics() async {
    _canCheckBiometrics = false;
    try {
      if (auth != null) {
        _canCheckBiometrics = await auth!.canCheckBiometrics;
      }
    } on PlatformException {
      _canCheckBiometrics = false;
    }
    return _canCheckBiometrics;
  }
  // get available biometric like face id, fingerprint
  Future<String> getBiometricType() async {
    String type = GlobalConstants.none;
    List<BiometricType> availableBiometrics = <BiometricType>[];
    if (auth != null) {
      availableBiometrics = await auth!.getAvailableBiometrics();
    }
    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        type = GlobalConstants.faceId;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        type = GlobalConstants.touchId;
      }
    } else {
      if (availableBiometrics.contains(BiometricType.face)) {
        type = GlobalConstants.faceId;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        type = GlobalConstants.touchId;
      }
    }
    // globalCache.idType = type;
    return type;
  }

  // authenticate biometric
  Future<bool> authenticate() async {
    isAuthenticating = false;
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Biometric Login';
      if (auth != null) {
        authenticated = await auth!.authenticate(
          biometricOnly: true,
        androidAuthStrings: const AndroidAuthMessages(
          signInTitle: 'Login with Biometric',
        ),
        localizedReason: 'Login into manxel account without credentials',
        );
      }
      isAuthenticating = false;
    } on PlatformException {
      print('error');
      isAuthenticating = false;
    }
    return authenticated;
  }
}
