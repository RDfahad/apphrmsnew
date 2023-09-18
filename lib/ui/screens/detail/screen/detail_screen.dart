import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/screens/detail/component/report_screen.dart';
import 'package:hr_emp_proj/ui/widgets/round_button.dart';
import '/ui/widgets/custom_app_bar.dart';
import '/ui/widgets/fl_charts/bar_graph.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
  final DateTime date = DateTime.now();
  final Map<String, String> listCards = {
    'Present': '25',
    'Absent': '01',
    'Holiday': '5',
    'Half Day': '10',
    'Week OF': '08',
    'Leave': '02',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          leadingIcon: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColor.whiteColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: "Details",
          actions: const [
            Icon(
              Icons.more_vert,
              color: AppColor.whiteColor,
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(height: context.getScreenHeight * 0.02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Working Hours',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.getScreenHeight * 0.02),
            Container(
              height: context.getScreenHeight * 0.28,
              width: context.getScreenWidth * 0.95,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 5,
                      color: AppColor.secondaryTextColor,
                      blurRadius: 40,
                    ),
                  ],
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(15)),
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
            SizedBox(height: context.getScreenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Attendance',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.getScreenHeight * 0.02),
            Expanded(child: AttendanceReportCard(listCards: listCards)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundElevatedButton(
                  borderRadius: 25,
                  height: context.getScreenHeight * 0.05,
                  width: context.getScreenWidth * 0.4,
                  title: "EDIT",
                  onPress: () {},
                ),
                RoundButton(
                  borderRadius: 25,
                  height: context.getScreenHeight * 0.05,
                  width: context.getScreenWidth * 0.4,
                  title: "DELETE",
                  textColor: AppColor.primaryColor,
                  buttonColor: AppColor.whiteColor,
                  onPress: () {},
                ),
              ],
            ),
            SizedBox(height: context.getScreenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
