import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../../utils/configuration.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo authenticationRepo;

  AuthenticationCubit(this.authenticationRepo)
      : super(AuthenticationState.init());

  Future<void> loginUser({String? email, String? password}) async {
    try {
      if (email == null || password == null) {
        emit(state.copyWith(
            errorMessage:
                "There is something wrong with your login credentials, please double-check and try again."));
      } else {
        emit(state.copyWith(loginLoading: true));
        var userLogin = await authenticationRepo.loginUser(
            email: email, password: password);
        // userLogin.data.token;
        // Config.authorization = userLogin.data?.token ?? '';
        // emit(state.copyWith(loginLoading: false,loginSuccessfull: true));
          emit(state.copyWith(
          email: email, password: password, errorMessage: null, isValid: true));
      }
    } catch (e) {
      ExceptionHandler().handleException(e);
      emit(state.copyWith(
          loginLoading: false, error: true, errorMessage: e.toString()));
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
