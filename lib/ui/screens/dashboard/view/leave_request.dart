import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/custom_app_bar.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

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
    AppColor.primaryTextColor
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
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
        child: Column(
          children: [
            SizedBox(height: context.getScreenHeight * 0.02),
            CardTops(listColor: listColor, listCards: listCards),
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
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: AppColor.whiteColor,
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      ' From',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.whiteColor,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return LeaveRequestCard(
                      fromDate: '2023-09-15',
                      toDate: '2023-09-20',
                      status: 'Approved',
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),

      //        ),
      //   ],
      // ),
    );
  }
}

class CardTops extends StatelessWidget {
  const CardTops({
    super.key,
    required this.listColor,
    required this.listCards,
  });

  final List listColor;
  final Map<String, String> listCards;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        3,
        (index) => Container(
          height: context.getScreenHeight * 0.12,
          width: context.getScreenWidth * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: listColor[index],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                listCards.keys.elementAt(index),
                style:
                    const TextStyle(fontSize: 14, color: AppColor.whiteColor),
              ),
              Text(
                listCards.values.elementAt(index),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaveRequestCard extends StatelessWidget {
  final String fromDate;
  final String toDate;
  final String status;

  LeaveRequestCard({
    required this.fromDate,
    required this.toDate,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fromDate,
                style: const TextStyle(
                  color: AppColor.secondaryTextColor,
                ),
              ),
              Text(
                '$toDate',
                style: const TextStyle(
                  color: AppColor.secondaryTextColor,
                ),
              ),
              Text(
                '$status',
                style: TextStyle(
                  color:
                      status == "Approved" ? Colors.green : AppColor.redColor,
                ),
              ),
              const Icon(
                Icons.more_vert,
                color: AppColor.secondaryTextColor,
              )
            ],
          ),
          SizedBox(height: context.getScreenHeight * 0.01),
          const Divider(
            thickness: 0.4,
            height: 1,
            color: AppColor.secondaryTextColor,
          )
        ],
      ),
    );
  }
}
