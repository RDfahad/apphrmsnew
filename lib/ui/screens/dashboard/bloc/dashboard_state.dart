
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../utils/hive_db/hive_db.dart';

class DashboardState {
  final String token;
  final bool isLoading;
  final UserData userData;
  final hiveStorage = HiveStorage();
  DashboardState({required this.token,required this.isLoading, required this.userData});

  factory DashboardState.init() => DashboardState(token: '',isLoading: false, userData: UserData());

  DashboardState copyWith({String? token, bool? isLoading, UserData? userData}){
    return DashboardState(
        token: token ?? this.token,
        isLoading: isLoading ?? this.isLoading,
        userData: userData ?? this.userData
    );
  }

}
