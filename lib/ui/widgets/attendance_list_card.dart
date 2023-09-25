import 'package:flutter/material.dart';

import '../../domain/entities/attendance/attendance_records.dart';
import '../../utils/app_color.dart';
import '../screens/attendance/cubit/attendance_cubit.dart';

class AttendenceListCard extends StatelessWidget {
  final String date;
  final String timeIn;
  final String timeOut;
  final String workingHr;

  const AttendenceListCard({
    super.key,
    required this.date,
    required this.timeIn,
    required this.timeOut,
    required this.workingHr,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            color: AppColor.primaryTextBlackColor,
          ),
        ),
        Text(
          timeIn,
          style: const TextStyle(
            color: AppColor.primaryTextBlackColor,
          ),
        ),
        Text(
          timeOut,
          style: TextStyle(
              color: timeOut == "absent"
                  ? AppColor.redColor
                  : AppColor.primaryTextBlackColor),
        ),
        Text(
          workingHr,
          style: const TextStyle(
            color: AppColor.primaryTextBlackColor,
          ),
        ),
      ],
    );
  }
}

// class PostList extends StatelessWidget {
//   final AttendenceObject attendanceObject;
//   final ScrollController controller;
//   final PaginationCubit cubit;
//   final String workingHr;

//   const PostList({
//     required this.attendanceObject,
//     required this.controller,
//     required this.cubit,
//     Key? key,
//     required this.workingHr,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (notification) {
//         if (notification is ScrollEndNotification &&
//             controller.position.extentAfter == 0) {
//           // Load more data when the user scrolls to the end of the list
//           cubit.loadMore();
//         }
//         return true;
//       },
//       child: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: attendanceObject.data?.length ?? 0,
//               controller: controller,
//               itemBuilder: (_, index) => Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       attendanceObject.data![index].date.toString(),
//                       style: const TextStyle(
//                         color: AppColor.primaryTextBlackColor,
//                       ),
//                     ),
//                     Text(
//                       attendanceObject.data![index].checkInTime.toString(),
//                       style: const TextStyle(
//                         color: AppColor.primaryTextBlackColor,
//                       ),
//                     ),
//                     Text(
//                       attendanceObject.data![index].checkOutTime.toString(),
//                       style: TextStyle(color: AppColor.primaryTextBlackColor),
//                     ),
//                     Text(
//                       workingHr,
//                       style: const TextStyle(
//                         color: AppColor.primaryTextBlackColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (cubit.state.isLoadMoreRunning)
//             const Padding(
//               padding: EdgeInsets.only(top: 10, bottom: 40),
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           if (!cubit.state.hasNextPage)
//             Container(
//               padding: const EdgeInsets.only(top: 30, bottom: 40),
//               color: Colors.amber,
//               child: const Center(
//                 child: Text('You have fetched all of the content'),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
