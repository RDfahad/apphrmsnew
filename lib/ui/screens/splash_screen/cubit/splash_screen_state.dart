import '/domain/entities/authentication_entities/login_user_entity.dart';

class SplashScreenState {
  final UserData userData;

  SplashScreenState({required this.userData});

  factory SplashScreenState.initial() =>
      SplashScreenState(userData: UserData());

  SplashScreenState copyWith({UserData? userData}) {
    return SplashScreenState(userData: userData ?? this.userData);
  }
}
