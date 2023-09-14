import 'package:flutter_bloc/flutter_bloc.dart';
enum BottomNavigationTabState {  homeScreen,leaveRequest, leaveRequestScreen ,profile }

class BottomNavigationCubit extends Cubit<BottomNavigationTabState> {
  BottomNavigationCubit() : super(BottomNavigationTabState.homeScreen);
  void changeTab(BottomNavigationTabState state) => emit(state);
}
