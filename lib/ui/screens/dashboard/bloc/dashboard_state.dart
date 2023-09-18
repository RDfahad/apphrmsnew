
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../utils/hive_db/hive_db.dart';


enum BottomNavigationTabState { homeScreen, attendance, detailReports, profile, setting }
class DashboardState {
  final String token;
  final bool isLoading;
  final UserData userData;
  final hiveStorage = HiveStorage();
  final BottomNavigationTabState bottomNavigationTabState;
  DashboardState({required this.token,required this.isLoading, required this.userData, required this.bottomNavigationTabState});

  factory DashboardState.init() => DashboardState(token: '',isLoading: false, userData: UserData(), bottomNavigationTabState:  BottomNavigationTabState.homeScreen);

  DashboardState copyWith({String? token, bool? isLoading, UserData? userData,BottomNavigationTabState? bottomNavigationTabState}){
    return DashboardState(
        token: token ?? this.token,
        isLoading: isLoading ?? this.isLoading,
        userData: userData ?? this.userData,
        bottomNavigationTabState: bottomNavigationTabState ?? this.bottomNavigationTabState
    );
  }

}
