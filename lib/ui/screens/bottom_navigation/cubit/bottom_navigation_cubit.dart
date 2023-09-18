import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavigationTabState { homeScreen, attendance, detailReports, profile, setting }

class BottomNavigationCubit extends Cubit<BottomNavigationTabState> {
  BottomNavigationCubit() : super(BottomNavigationTabState.homeScreen);
  void changeTab(BottomNavigationTabState state) => emit(state);
}
