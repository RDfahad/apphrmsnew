import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../../utils/configuration.dart';
import '../../../../utils/constants.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthenticationRepo authenticationRepo;

  DashboardCubit(this.authenticationRepo)
      : super(DashboardState.init());

  initState(){
    emit(DashboardState.init());
  }

  Future<void> refreshToken() async {
      emit(state.copyWith(isLoading: true));
      var userModel = state.hiveStorage.getData(GlobalConstants.userDate);
      log(userModel.toString());
      var userData = userModel != null
          ? UserData.fromJson(jsonDecode(userModel ?? ''))
          : null;
      Config.authorization = userData?.token ?? '';
      if (Config.isLoggedIn && Config.authorization.isEmpty) {
        await authenticationRepo.refreshToken().then((tokenData){
          Config.authorization = tokenData.data?.token ?? '';
          userData = UserData(
              user: userData!.user,
              token: tokenData.data?.token,
              tokenType: tokenData.data?.tokenType);
          state.hiveStorage.putData(GlobalConstants.userDate, jsonEncode(userData?.toJson()));
        },onError: (e){
          ExceptionHandler().handleException(e);
          if(e.errorCode == '999'){
            emit(state.copyWith(isLoading: false,isTokenExpired: true));
          }else{
            emit(state.copyWith(isLoading: false));
          }
        });
      }
      emit(state.copyWith(isLoading: false, userData: userData));
  }

  void changeTab(BottomNavigationTabState bottomNavigationTabState) =>
      emit(state.copyWith(bottomNavigationTabState: bottomNavigationTabState));

  void changeExpiryStatus(bool expiryStatus) =>
      emit(state.copyWith(isTokenExpired: false));

}
