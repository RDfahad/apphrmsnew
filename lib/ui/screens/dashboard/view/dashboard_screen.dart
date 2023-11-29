import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/models/working_hours_models.dart';
import 'package:hr_emp_proj/ui/screens/authentication/view/login_screen.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/bloc/dashboard_state.dart';
import 'package:hr_emp_proj/ui/screens/document_overview.dart/view/document_overview.dart';
import 'package:hr_emp_proj/ui/screens/leave_overview/screen/leave_overview.dart';
import 'package:hr_emp_proj/ui/screens/mega_menu/screen/mega_menu.dart';
import 'package:hr_emp_proj/ui/screens/offence/screen/offence_overview.dart';
import 'package:hr_emp_proj/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:hr_emp_proj/ui/screens/request_overview/screen/request_overview.dart';
import 'package:hr_emp_proj/utils/configuration.dart';
import 'package:http/http.dart' as http;

import '/utils/app_color.dart';
import '/utils/extension_methods.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/hive_db/hive_db.dart';
import '../../../widgets/fl_charts/bar_graph.dart';
import '../../../widgets/icon-card.dart';
import '../../../widgets/time_data.dart';

class DashBoardScreenNew extends StatelessWidget {
  DashBoardScreenNew({super.key});

  final List listIcon = [
    Icons.calendar_today_rounded,
    Icons.layers_outlined,
    Icons.chat,
    Icons.warning_rounded,
    Icons.copy,
  ];
  final List listIconName = [
    "Attendance",
    "Leaves",
    "Requests",
    "Offenses",
    "Documents",
  ];

  final List navigateScreens = [
    "Attendance",
    const LeaveOverViewScreen(),
    const RequestOverViewScreen(),
    const OffenceOverViewScreen(),
    const DocumentOverViewScreen()
  ];

  List<ResponseData> workingHours = [];
  Future<List<ResponseData>> getWorkingHorsApi() async {
    final response = await http.get(
        Uri.parse(
          'http://hrm.manxel.com/api/app/get_worked_hours',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 829|oYtewJXp9LXYgbiXaBu8gSMF0crASkJQ1bSPPs5Mcd6c253b'
          // Add other headers as needed
        });
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      workingHours.add(
        ResponseData.fromJson(data),
      );
      return workingHours;
    } else {
      return workingHours;
    }
  }

  @override
  Widget build(BuildContext context) {
    final myCubit = BlocProvider.of<DashboardCubit>(context);
    //  myCubit.refreshToken();
    

    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        body: BlocConsumer<DashboardCubit, DashboardState>(
          listenWhen: (DashboardState previous, DashboardState current) {
            if (current.userData.token?.isEmpty ?? true && !current.isLoading) {
              return true;
            } else {
              return false;
            }
          },
          listener: (context, state) {
            if (state.isTokenExpired) {
              context.read<DashboardCubit>().changeExpiryStatus(false);
              HiveStorage().putData(GlobalConstants.isLogIn, false);
              Config.isLoggedIn = false;
              Navigator.pushReplacement(
                  context, CupertinoPageRoute(builder: (_) => SignInScreen()));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.getScreenWidth * 0.02),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.getScreenWidth * 0.03),
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF0b84c8),
                                Color(0xff214cbd),
                                Color(0xff214cbd),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),
                        height: context.getScreenHeight * 0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: context.getScreenHeight * 0.03),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) =>
                                            const MegaMenuScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: List.generate(
                                  3,
                                  (index) => Container(
                                    margin: const EdgeInsets.only(left: 2),
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColor.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              state.userData.user?.name ?? '',
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: context
                                      .getFontText.headlineSmall!.fontSize,
                                  // fontSize: context.getFontText.headlineSmall!.fontSize,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              state.userData.user?.designation ?? '',
                              style: const TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: context.getScreenHeight * 0.02,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.flag,
                                  color: AppColor.primaryTextWhiteColor,
                                ),
                                Text(
                                  state.userData.user?.joiningDate ?? '',
                                  style: const TextStyle(
                                      color: AppColor.primaryTextWhiteColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.getScreenHeight * 0.02,
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Dashboard",
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "See All",
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: context.getScreenHeight * 0.01),
                                  Row(
                                    // direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      5,
                                      (index) => InkWell(
                                        onTap: () {
                                          if (index == 0) {
                                            context
                                                .read<DashboardCubit>()
                                                .changeTab(
                                                    BottomNavigationTabState
                                                        .attendance);
                                          } else if (index == 4) {
                                            context
                                                .read<DashboardCubit>()
                                                .changeTab(
                                                    BottomNavigationTabState
                                                        .detailReports);
                                          } else {
                                            nextScreenCupertino(context,
                                                navigateScreens[index]);
                                          }
                                        },
                                        child: IconCard(
                                          iconData: listIcon[index],
                                          iconName: listIconName[index],
                                          iconSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: context.getScreenHeight * 0.02),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    height: context.getScreenHeight * 0.1,
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColor.whiteColor,
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 0.2,
                                          color: Colors.grey.shade100,
                                          blurRadius: 3,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        timeData("Time In", "05:21:09 am"),
                                        Container(width: 1, color: Colors.grey),
                                        timeData("Time Out", "20:34:21 pm"),
                                        Container(width: 1, color: Colors.grey),
                                        timeData("Working Hrs", "20:34:21 pm"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: context.getScreenHeight * 0.03),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Weekly Attendance",
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Week 01 September",
                                        style: TextStyle(
                                          color: AppColor.blackColor,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: context.getScreenHeight * 0.03),
                                  Container(
                                    height: context.getScreenHeight * 0.28,
                                    width: context.getScreenWidth * 0.95,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 2,
                                            color: Colors.grey.shade100,
                                            blurRadius: 10,
                                          ),
                                        ],
                                        color: AppColor.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const MyBarGraph(
                                      monthlySummary: <double>[
                                        2,
                                        5,
                                        3,
                                        1,
                                        4,
                                        5,
                                        8,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.getScreenHeight * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: context.getScreenHeight * 0.11,
                    right: context.getScreenHeight * 0.025,
                    child: context.read<ProfileCubit>().state.image != null
                        ? Container(
                            height: context.getScreenHeight * 0.15,
                            width: context.getScreenHeight * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFd9d9d9),
                              border: Border.all(
                                color: AppColor.whiteColor,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 3,
                                  color: Colors.grey.shade100,
                                  blurRadius: 2,
                                ),
                              ],
                              image: DecorationImage(
                                image: FileImage(context
                                    .read<ProfileCubit>()
                                    .state
                                    .image!
                                    .absolute),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CachedNetworkImage(
                            height: context.getScreenHeight * 0.15,
                            width: context.getScreenHeight * 0.15,
                            imageUrl: context
                                    .read<DashboardCubit>()
                                    .state
                                    .userData
                                    .user
                                    ?.image ??
                                '',
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFd9d9d9),
                                border: Border.all(
                                  color: AppColor.whiteColor,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 1,
                                    color: Colors.grey.shade100,
                                    blurRadius: 2,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => SizedBox(
                              height: context.getScreenHeight * 0.002,
                              width: context.getScreenHeight * 0.002,
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
