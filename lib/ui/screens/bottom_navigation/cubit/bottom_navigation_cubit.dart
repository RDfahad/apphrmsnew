import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
enum BottomNavigationTabState { Tab1, Tab2, Tab3,Tab4 }

class BottomNavigationCubit extends Cubit<BottomNavigationTabState> {
  BottomNavigationCubit() : super(BottomNavigationTabState.Tab1);
  void changeTab(BottomNavigationTabState state) => emit(state);
}



class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 1 Content'),
    );
  }
}

class Tab2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 2 Content'),
    );
  }
}

class Tab3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tab 3 Content'),
    );
  }
}
