class AuthenticationState {
  final bool error;
  final String errorText;
  final bool loginLoading;
  final bool signUpLoading;
  final bool signUpSuccessfull;
  final bool loginSuccessfull;
  final String token;
  const AuthenticationState({
    required this.loginLoading,
    required this.signUpLoading,
    required this.signUpSuccessfull,
    required this.loginSuccessfull,
    required this.token
    , required this.error,
    required this.errorText});

  factory AuthenticationState.init() => const AuthenticationState(
      error: false,
      loginLoading: false,
      signUpLoading: false,
      signUpSuccessfull: false,
      loginSuccessfull: false,
      token: '',
      errorText: ''
  );

  AuthenticationState copyWith({bool? error,bool? loginLoading,bool? signUpLoading, bool? signUpSuccessfull, bool? loginSuccessfull, String? token, String? errorText}) =>
      AuthenticationState(
          error: error ?? this.error,
          loginLoading: loginLoading ?? this.loginLoading,
          signUpLoading: signUpLoading ?? this.signUpLoading,
          signUpSuccessfull: signUpSuccessfull ?? this.signUpSuccessfull,
          loginSuccessfull: loginSuccessfull ?? this.loginSuccessfull,
          token: token ?? this.token,
          errorText: errorText ?? this.errorText
      );
}
