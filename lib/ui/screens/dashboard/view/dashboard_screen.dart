import 'package:flutter/material.dart';
import '/ui/screens/dashboard/component/head_part.dart';
import '/ui/screens/dashboard/component/middle_part.dart';
import '/ui/screens/dashboard/view/leave_request.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  final Map<String, String> properties = {
    'Leave Request': 'leave_request.png',
    'Attendance': 'attendance.png',
    'Salary': 'salary.png',
    'Training': 'training.png',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: const Icon(
            Icons.arrow_back,
            color: AppColor.whiteColor,
          ),
          title: const Text(
            "Dashboard",
            style: TextStyle(fontSize: 16, color: AppColor.whiteColor),
          ),
          centerTitle: true,
          actions: [
            const Icon(
              Icons.more_vert,
              color: AppColor.whiteColor,
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: context.getScreenHeight * 0.24,
                child: const HeadPart(),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: context.getScreenHeight * 0.01)),
            SliverToBoxAdapter(
              child: GridViewScreenPart(
                properties: properties,
                pageName: [
                  LeaveRequestScreen(),
                  DashBoardScreen(),
                  LeaveRequestScreen(),
                  DashBoardScreen(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: context.getScreenHeight * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.whiteColor,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    timeData("In Time", "05:21:09 am"),
                    Container(width: 1, color: Colors.grey),
                    timeData("Break Time", "9 hr"),
                    Container(width: 1, color: Colors.grey),
                    timeData("Out Time", "20:34:21 pm"),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Column timeData(String title, String time) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColor.secondaryTextColor,
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 14.2,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryTextBlackColor,
          ),
        ),
      ],
    );
  }
}




// Widget _head() {
//   return Stack(
//     children: [
//       Column(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 140,
//             decoration: const BoxDecoration(
//               color: Color(0xff368983),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//           ),
//         ],
//       ),
//       Positioned(
//         top: 100,
//         left: 37,
//         child: Container(
//           height: 170,
//           width: 320,
//           decoration: BoxDecoration(
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromRGBO(47, 125, 121, 0.3),
//                 offset: Offset(0, 6),
//                 blurRadius: 12,
//                 spreadRadius: 6,
//               ),
//             ],
//             color: const Color.fromARGB(255, 47, 125, 121),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: const Column(
//             children: [
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Total Balance',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Icon(
//                       Icons.more_horiz,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 7),
//               Padding(
//                 padding: EdgeInsets.only(left: 15),
//                 child: Row(
//                   children: [
//                     Text(
//                       '\$ 145',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 25),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 13,
//                           backgroundColor: Color.fromARGB(255, 85, 145, 141),
//                           child: Icon(
//                             Icons.arrow_downward,
//                             color: Colors.white,
//                             size: 19,
//                           ),
//                         ),
//                         SizedBox(width: 7),
//                         Text(
//                           'Income',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 216, 216, 216),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 13,
//                           backgroundColor: Color.fromARGB(255, 85, 145, 141),
//                           child: Icon(
//                             Icons.arrow_upward,
//                             color: Colors.white,
//                             size: 19,
//                           ),
//                         ),
//                         SizedBox(width: 7),
//                         Text(
//                           'Expenses',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 216, 216, 216),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 6),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '\$ 125}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 17,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       '\$ 465',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 17,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       )
//     ],
//   );
// }
