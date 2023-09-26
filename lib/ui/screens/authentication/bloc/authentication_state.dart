import 'package:flutter/widgets.dart';
import 'package:hr_emp_proj/utils/constants.dart';
import '../../../../utils/local_auth/local_auth.dart';
import '/domain/entities/authentication_entities/login_user_entity.dart';
import '/utils/hive_db/hive_db.dart';

class AuthenticationState {
  final LoginUserModel loginUserModel;
  final bool error;
  final bool loginLoading;
  final bool signUpLoading;
  final bool signUpSuccessfull;
  final bool loginSuccessfull;
  final bool isButtonEnabled;
  final bool isIconFieldColorEnabled;
  final bool isBiometricEnable;
  final bool isBiometricAvailable;
  final String? errorMessage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String token;
  final String biometricType;
  final hiveStorage = HiveStorage();
  LocalAuthenticationService localAuthenticationService = LocalAuthenticationService();

  AuthenticationState({
    required this.loginUserModel,
    required this.loginLoading,
    required this.signUpLoading,
    required this.signUpSuccessfull,
    required this.loginSuccessfull,
    required this.isBiometricEnable,
    required this.isBiometricAvailable,
    required this.token,
    required this.biometricType,
    required this.error,
    required this.isButtonEnabled,
    this.errorMessage,
    required this.emailController,
    required this.passwordController,
    required this.isIconFieldColorEnabled,
  });

  factory AuthenticationState.init() => AuthenticationState(
      isIconFieldColorEnabled: false,
      error: false,
      loginLoading: false,
      signUpLoading: false,
      signUpSuccessfull: false,
      loginSuccessfull: false,
      isBiometricEnable: false,
      isBiometricAvailable: false,
      token: '',
      biometricType: GlobalConstants.none,
      isButtonEnabled: false,
      errorMessage: null,
      emailController: TextEditingController(text: ''),
      passwordController: TextEditingController(text: ''),
      loginUserModel: LoginUserModel());

  AuthenticationState copyWith({
    bool? isIconFieldColorEnabled,
    bool? error,
    bool? loginLoading,
    bool? signUpLoading,
    bool? signUpSuccessfull,
    bool? loginSuccessfull,
    bool? isBiometricEnable,
    bool? isBiometricAvailable,
    String? token,
    String? biometricType,
    bool? isButtonEnabled,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    LoginUserModel? loginUserModel,
  }) =>
      AuthenticationState(
        isIconFieldColorEnabled:
            isIconFieldColorEnabled ?? this.isIconFieldColorEnabled,
        loginUserModel: loginUserModel ?? this.loginUserModel,
        error: error ?? this.error,
        loginLoading: loginLoading ?? this.loginLoading,
        signUpLoading: signUpLoading ?? this.signUpLoading,
        signUpSuccessfull: signUpSuccessfull ?? this.signUpSuccessfull,
        loginSuccessfull: loginSuccessfull ?? this.loginSuccessfull,
        isBiometricEnable: isBiometricEnable ?? this.isBiometricEnable,
        token: token ?? this.token,
        biometricType: biometricType ?? this.biometricType,
        isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
        isBiometricAvailable: isBiometricAvailable ?? this.isBiometricAvailable,
        errorMessage: errorMessage ?? this.errorMessage,
        emailController: emailController ?? this.emailController,
        passwordController: passwordController ?? this.passwordController,
      );
}
