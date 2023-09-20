import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/view/dashboard_screen.dart';
import '../bloc/dashboard_state.dart';
import '/ui/screens/dashboard/component/container_card.dart';
import '/utils/extension_methods.dart';

class GridViewScreenPart extends StatelessWidget {
  const GridViewScreenPart({
    super.key,
    required this.properties,
    required this.pageName,
  });

  final Map<String, String> properties;
  final List pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.03),
      height: context.getScreenHeight * 0.4,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ContainerCards(
              images: "assets/images/${properties.values.elementAt(index)}",
              title: properties.keys.elementAt(index),
              onPressed: () {
                index == 01
                    ? context
                        .read<DashboardCubit>()
                        .changeTab(BottomNavigationTabState.attendance)
                    : Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => pageName[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
