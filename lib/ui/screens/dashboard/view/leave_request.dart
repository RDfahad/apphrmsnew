import 'package:flutter/material.dart';
import '../../../widgets/attendance_list_card.dart';
import '../../../widgets/status_card.dart';
import '/ui/widgets/custom_app_bar.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class LeaveRequestScreen extends StatelessWidget {
  LeaveRequestScreen({super.key});

  final Map<String, String> listCards = {
    'Annual Leave': '4/9',
    'Medical Leaves': '3/8',
    'Casual Leaves': '2/6',
  };

  final List listColor = [
    AppColor.primaryColor,
    AppColor.secondaryColor,
    AppColor.primaryTextBlackColor
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Center(
            heightFactor: 10,
            child: Icon(
              Icons.add,
              color: AppColor.whiteColor,
            )),
      ),
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
          title: "Leave Request",
          actions: const [
            Icon(
              Icons.more_vert,
              color: AppColor.whiteColor,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(height: context.getScreenHeight * 0.02),
            StatusCard(listColor: listColor, listCards: listCards),
            SizedBox(height: context.getScreenHeight * 0.03),
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
            SizedBox(height: context.getScreenHeight * 0.03),
            Container(
              height: context.getScreenHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.whiteColor,
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 1,
                    color: AppColor.whiteColor,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "Time In",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "Time Out",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "Working Hrs",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.03),
            Container(
              color: AppColor.whiteColor,
              child: ListView.separated(
                separatorBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
                    child: Divider(
                      color: Colors.grey.shade300,
                      thickness: 0.5,
                    ),
                  );
                },
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const AttendenceListCard(
                      date: '2023-09-15',
                      timeIn: '2023-09-20',
                      timeOut: 'Approved',
                      workingHr: "9",
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.03),
          ],
        ),
      ),

      //        ),
      //   ],
      // ),
    );
  }
}