import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/widgets/attendance_details_tab.dart';
import '/ui/screens/attendance/cubit/attendance_cubit.dart';
import '/ui/screens/attendance/cubit/attendance_state.dart';
import '/utils/extension_methods.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/helper.dart';
import '../../../widgets/attendance_list_card.dart';

class AttendanceRecordsScreen extends StatelessWidget {
  const AttendanceRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: BlocBuilder(
        bloc: BlocProvider.of<AttendanceCubit>(context)..getAttendance(),
        builder: (context, AttendanceState state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.getScreenWidth * 0.03,
            ),
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (state.attendanceRecordScrollController.position.pixels ==
                        state.attendanceRecordScrollController.position
                            .maxScrollExtent &&
                    !state
                        .attendanceRecordScrollController.position.outOfRange) {
                  context.read<AttendanceCubit>().getAttendance();
                }
                return true;
              },
              child: CustomScrollView(
                controller: state.attendanceRecordScrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.appBackgroundColor,
                    expandedHeight: context.getScreenHeight * 0.15,
                    pinned: true,
                    flexibleSpace: Container(
                      alignment: Alignment.bottomLeft,
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
                        ),
                      ),
                      height: context.getScreenHeight * 0.2,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.getScreenWidth * 0.02,
                          vertical: context.getScreenHeight * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: AppColor.whiteColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                            const Text(
                              "Attendance",
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                            const Text(
                              "Overview",
                              style: TextStyle(
                                  color: AppColor.primaryTextWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: context.getScreenHeight * 0.03,
                      ),
                      const AttendanceDetailsTab(),
                      SizedBox(height: context.getScreenHeight * 0.02),
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
                        child: Row(
                          children: [
                            const Spacer(),
                            const Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            SizedBox(
                              width: context.getScreenWidth * 0.15,
                            ),
                            const Text(
                              "Time In",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            SizedBox(
                              width: context.getScreenWidth * 0.1,
                            ),
                            const Text(
                              "Time Out",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            SizedBox(
                              width: context.getScreenWidth * 0.06,
                            ),
                            const Text(
                              "Working Hrs",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(height: context.getScreenHeight * 0.015),
                    ]),
                  ),
                  SliverToBoxAdapter(
                    child: state.attendanceRecords.data?.isNotEmpty ?? false
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: ListView.separated(
                                // reverse: true,
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            context.getScreenWidth * 0.02),
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                      thickness: 0.5,
                                    ),
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.attendanceRecords.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: AttendenceListCard(
                                      workingHr: Helper.calculateWorkingHours(
                                          date: state.attendanceRecords
                                              .data?[index].date,
                                          startTime: state.attendanceRecords
                                              .data?[index].checkInTime,
                                          endTime: state.attendanceRecords
                                              .data?[index].checkOutTime),
                                      timeOut: state.attendanceRecords
                                              .data?[index].checkOutTime ??
                                          '',
                                      timeIn: state.attendanceRecords
                                              .data?[index].checkInTime ??
                                          '',
                                      date: state.attendanceRecords.data?[index]
                                              .date ??
                                          '',
                                    ),
                                  );
                                }),
                          )
                        : const Center(child: Text('No Attendance Found')),
                  ),
                  SliverToBoxAdapter(
                      child: state.loadMore
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
