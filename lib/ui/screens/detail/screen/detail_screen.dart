import 'package:flutter/material.dart';
import '/ui/widgets/custom_app_bar.dart';
import '/ui/widgets/fl_charts/bar_graph.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          SizedBox(height: context.getScreenHeight * 0.02),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Leave Request Info',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  'This Year',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: 350,
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
        ],
      ),
    );
  }
}
