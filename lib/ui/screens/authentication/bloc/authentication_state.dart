class AuthenticationState {
  final bool error;
  final bool loginLoading;
  final bool signUpLoading;
  final bool signUpSuccessfull;
  final bool loginSuccessfull;
  final String email;
  final String password;
  final bool isValid;
  final String? errorMessage;

  final String token;
  const AuthenticationState({
    required this.loginLoading,
    required this.signUpLoading,
    required this.signUpSuccessfull,
    required this.loginSuccessfull,
    required this.token,
    required this.error,
    required this.email,
    required this.password,
    required this.isValid,
    this.errorMessage,
  });

  factory AuthenticationState.init() => const AuthenticationState(
      error: false,
      loginLoading: false,
      signUpLoading: false,
      signUpSuccessfull: false,
      loginSuccessfull: false,
      token: '',
      email: "",
      password: "",
      isValid: false,
      errorMessage: null);

  AuthenticationState copyWith({
    bool? error,
    bool? loginLoading,
    bool? signUpLoading,
    bool? signUpSuccessfull,
    bool? loginSuccessfull,
    String? token,
    String? email,
    String? password,
    bool? isValid,
    String? errorMessage,
  }) =>
      AuthenticationState(
        error: error ?? this.error,
        loginLoading: loginLoading ?? this.loginLoading,
        signUpLoading: signUpLoading ?? this.signUpLoading,
        signUpSuccessfull: signUpSuccessfull ?? this.signUpSuccessfull,
        loginSuccessfull: loginSuccessfull ?? this.loginSuccessfull,
        token: token ?? this.token,
        email: email ?? this.email,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
