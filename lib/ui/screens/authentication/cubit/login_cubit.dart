import 'package:bloc/bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginStateWithCubit> {
  LoginCubit() : super(LoginStateWithCubit.initila());
  Future<void> loginUser({String? email, String? password}) async {
    emit(state.copyWith(errorMessage: null, isValid: false));
    if (email == null || password == null) {
      emit(state.copyWith(
          errorMessage:
              "There is something wrong with your login credentials, please double-check and try again."));
    } else {
      emit(state.copyWith(
          email: email, password: password, errorMessage: null, isValid: true));
    }
  }
}
