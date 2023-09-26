import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

import '../../../utils/app_color.dart';

class DocumentOverViewScreen extends StatelessWidget {
  DocumentOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * 0.02),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Document",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Overview",
                        style: TextStyle(
                            color: AppColor.primaryTextWhiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.03),
                Row(
                  children: [
                    const Flexible(
                        child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: AppColor.secondaryTextColor,
                        hintText: "Search",
                      ),
                    )),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryButtonColor),
                        onPressed: () {},
                        icon: Image.asset("assets/icons/filter_icon1.png"),
                        label: const Text(
                          " Filter ",
                          style: TextStyle(color: AppColor.whiteColor),
                        ))
                  ],
                ),
                SizedBox(height: context.getScreenHeight * 0.05),
                Container(
                  padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                        ),
                      ],
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Title:", ""),
                      _buildInfoRow("Category:", ""),
                      _buildInfoRow("Status:", ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow("Type:", ""),
                          Row(
                            children: [
                              Image.asset("assets/icons/download_icon.png"),
                              SizedBox(width: 10),
                              Image.asset("assets/icons/square_grid.png"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.03),
                Container(
                  padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                        ),
                      ],
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Title:", ""),
                      _buildInfoRow("Category:", ""),
                      _buildInfoRow("Status:", ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow("Type:", ""),
                          Row(
                            children: [
                              Image.asset("assets/icons/download_icon.png"),
                              SizedBox(width: 10),
                              Image.asset("assets/icons/square_grid.png"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.getScreenHeight * 0.03),
                Container(
                  padding: EdgeInsets.all(context.getScreenHeight * 0.02),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          color: Colors.grey.shade200,
                          blurRadius: 2,
                        ),
                      ],
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow("Title:", ""),
                      _buildInfoRow("Category:", ""),
                      _buildInfoRow("Status:", ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow("Type:", ""),
                          Row(
                            children: [
                              Image.asset("assets/icons/download_icon.png"),
                              SizedBox(width: 10),
                              Image.asset("assets/icons/square_grid.png"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoRow(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColor.secondaryTextColor,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: 20,
          color: AppColor.secondaryTextColor,
        ),
      ),
    ],
  );
}
