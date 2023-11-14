import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/request_overview/cubit/request_overview_state.dart';
import 'package:hr_emp_proj/ui/screens/request_overview/screen/custom_steeper.dart';
import '../../../widgets/circle_dot_bordr.dart';
import '../cubit/request_overview_cubit.dart';
import '/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';

class RequestOverViewScreen extends StatelessWidget {
  const RequestOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
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
                height: context.getScreenHeight * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Request",
                      style: context.getFontText.titleLarge!.copyWith(
                        color: AppColor.primaryTextWhiteColor,
                      ),
                    ),
                    Text(
                      "Overview",
                      style: TextStyle(
                        color: AppColor.primaryTextWhiteColor,
                        fontSize: context.getFontText.titleLarge!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.getScreenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const CircularDotsProgress(),
                      SizedBox(width: context.getScreenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Offense',
                            style: context.getFontText.bodyMedium!
                                .copyWith(color: AppColor.primaryTextBlackColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '20',
                            style: context.getFontText.labelMedium!
                                .copyWith(color: AppColor.primaryTextBlackColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const CircularDotsProgress(),
                      SizedBox(width: context.getScreenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This Month',
                            style: context.getFontText.bodyMedium!
                                .copyWith(color: AppColor.primaryTextBlackColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '20',
                            style: context.getFontText.labelMedium!
                                .copyWith(color: AppColor.primaryTextBlackColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.getScreenHeight * 0.03),
              Row(
                children: [
                  Flexible(
                      child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: AppColor.secondaryTextColor.withOpacity(0.5),
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: AppColor.secondaryTextColor.withOpacity(0.5),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.secondaryTextColor.withOpacity(0.5),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColor.secondaryTextColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(
                    height: context.getScreenHeight * 0.042,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryButtonColor),
                        onPressed: () {
                          log("Working on");
                          context.read<RequestOverviewCubit>().getRequestOverview();
                        },
                        icon: Image.asset("assets/icons/filter_icon1.png"),
                        label: const Text(
                          " Filter ",
                          style: TextStyle(color: AppColor.whiteColor),
                        )),
                  )
                ],
              ),
              SizedBox(height: context.getScreenHeight * 0.03),
              // BlocBuilder<RequestOverviewCubit, RequestOverviewState>(builder: (context, state) {
              //   return Container(
              //       height: state.isCheckheight
              //           ? context.getScreenHeight * (0.2 + (3 * 0.14))
              //           : context.getScreenHeight * 0.2,
              //       padding: EdgeInsets.all(context.getScreenHeight * 0.02),
              //       decoration: BoxDecoration(boxShadow: [
              //         BoxShadow(
              //           spreadRadius: 0.5,
              //           color: Colors.grey.shade300,
              //           blurRadius: 5,
              //         ),
              //       ], color: AppColor.whiteColor, borderRadius: BorderRadius.circular(12)),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const Row(
              //             children: [
              //               Text(
              //                 'Request Subject',
              //                 style: TextStyle(
              //                   fontWeight: FontWeight.w800,
              //                   fontSize: 12,
              //                   color: AppColor.blackColor,
              //                 ),
              //               ),
              //               Text(
              //                 '',
              //                 style: TextStyle(
              //                   fontSize: 20,
              //                   color: AppColor.secondaryTextColor,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           buildInfoRow("Date:", ""),
              //           buildInfoRow("Category:", ""),
              //           SizedBox(height: context.getScreenHeight * 0.02),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Row(
              //                 children: [
              //                   const Text(
              //                     'Status:',
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 12,
              //                       color: AppColor.secondaryTextColor,
              //                     ),
              //                   ),
              //                   Container(
              //                     margin: const EdgeInsets.only(left: 4),
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: context.getScreenWidth * 0.02, vertical: 2),
              //                     decoration: BoxDecoration(
              //                       color: Colors.green.shade100,
              //                       borderRadius: BorderRadius.circular(5),
              //                     ),
              //                     child: Text(
              //                       'Approved',
              //                       style: TextStyle(
              //                         fontSize: 12,
              //                         color: Colors.green.shade800,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: context.getScreenHeight * 0.042,
              //                 child: ElevatedButton(
              //                     style:
              //                         ElevatedButton.styleFrom(backgroundColor: AppColor.primaryButtonColor),
              //                     onPressed: () {
              //                       log('context.getScreenHeight ${context.getScreenHeight}');
              //                       context.read<RequestOverviewCubit>().updateIsCheckValue();
              //                     },
              //                     child: const Text(
              //                       "Details",
              //                       style: TextStyle(color: AppColor.whiteColor),
              //                     )),
              //               ),
              //             ],
              //           ),
              //           SizedBox(height: context.getScreenHeight * 0.01),
              //           if (state.isCheckheight)
              //             const Column(
              //               children: [
              //                 CustomSteeperCard(title: 'Team Lead', status: "Approved"),
              //                 CustomSteeperCard(title: "HR Manager", status: "Pending"),
              //                 CustomSteeperCard(title: "HR Manager", status: "Pending"),
              //               ],
              //             ),
              //         ],
              //       ));
              // }),
              BlocBuilder<RequestOverviewCubit, RequestOverviewState>(builder: (context, state) {
                log("state.requestModel.responseData?.reqests?.length   ${state.requestModel.responseData?.reqests?.length}");
                final cubitValue = state.requestModel.responseData?.reqests;
                return Column(
                  children: List.generate(
                    state.requestModel.responseData?.reqests?.length ?? 0,
                    (index) => RequestOverviewCard(
                      title: cubitValue?[index].requestSubject ?? '',
                      date: cubitValue?[index].applyDate ?? '',
                      category: cubitValue?[index].category ?? '',
                      status: cubitValue?[index].requestStatus ?? '',
                      isExpanded: state.isCheckheight[1],
                      onDetailsPressed: () {
                        log('context.getScreenHeight ${state.isCheckheight[2]}');
                        context.read<RequestOverviewCubit>().updateIsCheckValue(1);
                      },
                      columnWidget: const [
                        CustomSteeperCard(title: 'Team Lead', status: "Approved"),
                        CustomSteeperCard(title: "HR Manager", status: "Pending"),
                        CustomSteeperCard(title: "HR Manager", status: "Pending"),
                        CustomSteeperCard(title: "HR Manager", status: "Pending"),
                      ],
                    ),
                  ),
                  // children: [

                  //   // RequestOverviewCard(
                  //   //   title: '',
                  //   //   date: '',
                  //   //   category: '',
                  //   //   status: 'Approved',
                  //   //   isExpanded: state.isCheckheight[2],
                  //   //   onDetailsPressed: () {
                  //   //     log('context.getScreenHeight ${state.isCheckheight[2]}');
                  //   //     context.read<RequestOverviewCubit>().updateIsCheckValue(2);
                  //   //   },
                  //   //   columnWidget: const [
                  //   //     CustomSteeperCard(title: 'Team Lead', status: "Approved"),
                  //   //     CustomSteeperCard(title: "HR Manager", status: "Pending"),
                  //   //   ],
                  //   // ),

                  // ],
                );
              }),

              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RequestOverviewCard extends StatelessWidget {
  final String title;
  final String date;
  final String category;
  final String status;
  final bool isExpanded;
  final Function()? onDetailsPressed;
  final List<Widget> columnWidget;

  const RequestOverviewCard({
    super.key,
    required this.title,
    required this.date,
    required this.category,
    required this.status,
    this.isExpanded = false,
    this.onDetailsPressed,
    required this.columnWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.getScreenHeight * 0.02),
      // height: isExpanded
      //     ? context.getScreenHeight * (0.2 + (columnWidget.length * 0.14))
      //     : context.getScreenHeight * 0.2,
      padding:
          EdgeInsets.all(context.getScreenHeight * 0.02).copyWith(bottom: context.getScreenHeight * 0.02),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.5,
            color: Colors.grey.shade300,
            blurRadius: 5,
          ),
        ],
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Request Subject',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                title, // Pass the title here
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.secondaryTextColor,
                ),
              ),
            ],
          ),
          buildInfoRow("Date:  ", date), // Pass the date here
          buildInfoRow("Category:   ", category), // Pass the category here
          SizedBox(height: context.getScreenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Status:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: status == "Approved" ? Colors.green.shade100 : Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        color: status == "Approved" ? Colors.green.shade800 : Colors.blue.shade800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.getScreenHeight * 0.042,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryButtonColor,
                  ),
                  onPressed: onDetailsPressed,
                  child: const Text(
                    "Details",
                    style: TextStyle(color: AppColor.whiteColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.getScreenHeight * 0.01),
          if (isExpanded)
            Column(
              children: columnWidget,
            ),
        ],
      ),
    );
  }
}

Widget buildInfoRow(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: AppColor.secondaryTextColor,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 12,
          color: AppColor.secondaryTextColor,
        ),
      ),
    ],
  );
}
