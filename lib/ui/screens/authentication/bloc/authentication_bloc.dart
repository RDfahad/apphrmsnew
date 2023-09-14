import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '/domain/entities/authentication_entities/login_user_entity.dart';
import '/utils/hive_db/hive_db.dart';

import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo authenticationRepo;

  AuthenticationCubit(this.authenticationRepo)
      : super(AuthenticationState.init());

  checkButtonEnabledDisabled() {
    if (state.emailController.text.isEmpty ||
        state.passwordController.text.isEmpty) {
      emit(state.copyWith(isButtonEnabled: false));
    } else {
      emit(state.copyWith(isButtonEnabled: true));
    }

    if (state.emailController.text.isNotEmpty) {
      emit(state.copyWith(isIconFieldColorEnabled: true));
    }
  }

  Future<void> loginUser({String? email, String? password}) async {
    try {
      emit(state.copyWith(loginLoading: true, loginSuccessfull: false));
      LoginUserModel userLogin =
          await authenticationRepo.loginUser(email: email, password: password);
      if (userLogin.data != null) {
        state.hiveStorage.putData(
            "userdata",
            jsonEncode(UserData(
                    user: userLogin.data!.user,
                    token: userLogin.data!.token,
                    tokenType: userLogin.data!.tokenType)
                .toJson()));
      }
      emit(state.copyWith(
        loginLoading: false,
        loginSuccessfull: true,
        loginUserModel: userLogin,
        isIconFieldColorEnabled: false,
      ));
    } catch (e) {
      log("Log From Cubit Eror $e");

      ExceptionHandler().handleException(e);
      emit(state.copyWith(
        loginLoading: false,
        error: true,
        errorMessage: e.toString(),
        loginSuccessfull: false,
        isIconFieldColorEnabled: false,
      ));
    }
  }

  removeError() {
    emit(state.copyWith(
        error: false,
        errorMessage: '',
        loginSuccessfull: false,
        signUpSuccessfull: false));
  }
}
