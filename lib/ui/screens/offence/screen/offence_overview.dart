import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../widgets/circle_dot_bordr.dart';
import '../../document_overview.dart/document_overview.dart';
import '/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';

class OffenceOverViewScreen extends StatelessWidget {
  const OffenceOverViewScreen({super.key});

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
                      "Offenses",
                      style: TextStyle(
                        color: AppColor.primaryTextWhiteColor,
                        fontSize: context.getFontText.titleLarge!.fontSize,
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
              // Transform.rotate(
              //   angle: 10,
              //   child: CircularDotsProgress(),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(height: context.getScreenHeight * 0.04),
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
                        onPressed: () {},
                        icon: Image.asset("assets/icons/filter_icon1.png"),
                        label: const Text(
                          " Filter ",
                          style: TextStyle(color: AppColor.whiteColor),
                        )),
                  )
                ],
              ),
              SizedBox(height: context.getScreenHeight * 0.05),
              Container(
                padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.5,
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                  ),
                ], color: AppColor.whiteColor, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoRow("Offense:", ""),
                    buildInfoRow("Category:", ""),
                    buildInfoRow("Value:", ""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoRow("Marked By:", ""),
                        Image.asset("assets/icons/square_grid.png"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.getScreenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
