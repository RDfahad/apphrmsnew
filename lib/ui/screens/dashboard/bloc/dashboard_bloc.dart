import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/entities/authentication_entities/refresh_token.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../../utils/configuration.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthenticationRepo authenticationRepo;

  DashboardCubit(this.authenticationRepo)
      : super(DashboardState.init());

  Future<void> refreshToken() async {
    try {
      emit(state.copyWith(isLoading: true));
      var userModel = state.hiveStorage.getData("userdata");
      log(userModel.toString());
      var userData = userModel != null ? UserData.fromJson(
          jsonDecode(userModel ?? '')) : null;
      Config.authorization = userData?.token ?? '';
      if (Config.isLoggedIn) {
      RefreshToken tokenData = await authenticationRepo.refreshToken();
      Config.authorization = tokenData.data?.token ?? '';
      userData = UserData(
          user: userData!.user,
          token: tokenData.data?.token,
          tokenType: tokenData.data?.tokenType);
      state.hiveStorage.putData(
          "userdata",
          jsonEncode(userData.toJson()));
    }
      emit(state.copyWith(isLoading: false, userData: userData));
    } catch (e) {
      ExceptionHandler().handleException(e);
      emit(state.copyWith(isLoading: false));
    }
  }

  void changeTab(BottomNavigationTabState bottomNavigationTabState) => emit(state.copyWith(bottomNavigationTabState: bottomNavigationTabState));
}