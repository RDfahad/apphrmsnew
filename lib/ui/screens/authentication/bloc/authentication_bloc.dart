import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/utils/hive_db/hive_db.dart';
import '../../../../utils/configuration.dart';
import '../../../../utils/constants.dart';
import '/domain/entities/authentication_entities/login_user_entity.dart';
import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepo authenticationRepo;

  AuthenticationCubit(this.authenticationRepo)
      : super(AuthenticationState.init());

  init()async{
    await state.localAuthenticationService.checkBiometrics().then((biometricAvailable)async{
      emit(state.copyWith(isBiometricAvailable: biometricAvailable));
      if(biometricAvailable) {
        await state.localAuthenticationService.getBiometricType().then((
            biometricType) {
          emit(state.copyWith(biometricType: biometricType));
        });
      }
    });
    var biometricEnable = HiveStorage().getData(GlobalConstants.isBiometricEnabled);
    emit(state.copyWith(isBiometricEnable: biometricEnable));
  }

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
    else{
      emit(state.copyWith(isIconFieldColorEnabled: false));
    }
  }

  Future<void> loginUser({String? email, String? password,bool isBiometric = false}) async {
      print('asd');
      emit(state.copyWith(loginLoading: true, loginSuccessfull: false, error: false, errorMessage: ''));
      await authenticationRepo.loginUser(email: email, password: password).then((userLogin){
        if( HiveStorage().getData(GlobalConstants.email) != email){
          HiveStorage().putData(GlobalConstants.isBiometricEnabled,false);
        }
        if (userLogin.data != null) {
          state.hiveStorage.putData(
              GlobalConstants.userDate,
              jsonEncode(UserData(
                  user: userLogin.data!.user,
                  token: userLogin.data!.token,
                  tokenType: userLogin.data!.tokenType)
                  .toJson()));
          state.hiveStorage.putData(
              GlobalConstants.isLogIn,true);
          Config.authorization = userLogin.data?.token ?? '';
          if(!isBiometric){
            state.hiveStorage.putData(
                GlobalConstants.email, state.emailController.text);
            state.hiveStorage.putData(
                GlobalConstants.password, state.passwordController.text);
          }
        }
        emit(state.copyWith(
          loginLoading: false,
          loginSuccessfull: true,
          loginUserModel: userLogin,
          isIconFieldColorEnabled: false,
        ));
          },onError: (e){
        print('asdajsd');
        log("Log From Cubit Eror $e");
        ExceptionHandler().handleException(e);
        emit(state.copyWith(
          loginLoading: false,
          error: true,
          errorMessage: e.toString(),
          loginSuccessfull: false,
          isIconFieldColorEnabled: false,
        ));
      });
  }

  removeError() {
    emit(state.copyWith(
        error: false,
        errorMessage: '',
        loginSuccessfull: false,
        signUpSuccessfull: false));
  }
}
