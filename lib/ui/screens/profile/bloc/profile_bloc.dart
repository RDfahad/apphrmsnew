import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/profile/bloc/profile_state.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/hive_db/hive_db.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState.init());

  init() {
    var biometricEnable =
        HiveStorage().getData(GlobalConstants.isBiometricEnabled);
    emit(state.copyWith(touchId: biometricEnable));
  }

  changeTouchId(bool touchId) {
    emit(state.copyWith(touchId: touchId));
  }
}
