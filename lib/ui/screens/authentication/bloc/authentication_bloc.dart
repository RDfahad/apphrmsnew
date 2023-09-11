import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/http/exception_handler.dart';
import '../../../../domain/repository/authentication_repo/authentication_repo.dart';
import '../../../../utils/configuration.dart';
import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState>{
  final AuthenticationRepo authenticationRepo;

  AuthenticationCubit(this.authenticationRepo) : super(AuthenticationState.init());

  Future<void> signupUser({String? firstName, String? lastName, String? email, String? password})async{
    try{
      // emit(state.copyWith(signUpLoading: true));
      // var userSignup = await authenticationRepo.signUpUser(email: email,firstName: firstName,lastName: lastName, password: password);
      // emit(state.copyWith(signUpLoading: false, signUpSuccessfull: true));
    }
    catch(e){
      ExceptionHandler().handleException(e);
      emit(state.copyWith(signUpLoading: false, error: true,errorText: e.toString()));
    }
  }

  Future<void> loginUser({String? email, String? password})async{
    try{
      emit(state.copyWith(loginLoading: true));
      var userLogin = await authenticationRepo.loginUser(email: email, password: password);
      // userLogin.data.token;
      Config.authorization = userLogin.data?.token ?? '';
      emit(state.copyWith(loginLoading: false,loginSuccessfull: true));
    }
    catch(e){
      ExceptionHandler().handleException(e);
      emit(state.copyWith(loginLoading: false, error: true,errorText: e.toString()));
    }
  }

  removeError(){
    emit(state.copyWith(error: false,errorText: '', loginSuccessfull: false, signUpSuccessfull: false));
  }

}