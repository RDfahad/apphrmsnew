class LoginState {}

class SignInInitialState extends LoginState {}

class SignInInValidState extends LoginState {}

class SignInValidState extends LoginState {}

class SignInErroState extends LoginState {
  final String errorMessage;

  SignInErroState({required this.errorMessage});
}

class SignInLoadingState extends LoginState {}

class LoginStateWithCubit {
  final String email;
  final String password;
  final bool isValid;
  final String? errorMessage;

  LoginStateWithCubit({
    required this.email,
    required this.password,
    required this.isValid,
    this.errorMessage,
  });

  factory LoginStateWithCubit.initila() => LoginStateWithCubit(
      email: "", password: "", isValid: false, errorMessage: null);

  LoginStateWithCubit copyWith(
      {String? email, String? password, bool? isValid, String? errorMessage}) {
    return LoginStateWithCubit(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
