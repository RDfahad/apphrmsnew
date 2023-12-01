import 'package:flutter/material.dart';
import '/utils/extension_methods.dart';

import '../../../../utils/app_color.dart';

class LeaveOverViewScreen extends StatelessWidget {
  const LeaveOverViewScreen({super.key});

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
                      "Leaves",
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LeavesCard(
                      title: 'Annual Leaves',
                      subtitle: 'Not Eligible',
                      imageAsset: 'assets/icons/profile_user.png',
                      isRedColor: true,
                    ),
                  ),
                  Flexible(
                    child: LeavesCard(
                      title: 'Casual Leaves',
                      subtitle: '06',
                      imageAsset: 'assets/icons/profile_user.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.getScreenHeight * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: LeavesCard(
                      title: 'Sick Leaves',
                      subtitle: '06',
                      imageAsset: 'assets/icons/profile_user.png',
                    ),
                  ),
                  Flexible(
                    child: LeavesCard(
                      title: 'Leaves Avail',
                      subtitle: '03',
                      imageAsset: 'assets/icons/profile_user.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.getScreenHeight * 0.04),
              const MyOrderTable()
            ],
          ),
        ),
      ),
    );
  }
}

class LeavesCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final bool? isRedColor;
  const LeavesCard({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    Key? key,
    this.isRedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getScreenWidth * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(imageAsset,
              height: context.getScreenHeight * 0.06, color: Color.fromARGB(255, 22, 106, 233)),
          SizedBox(width: context.getScreenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.getFontText.labelSmall!.copyWith(color: AppColor.primaryTextBlackColor),
              ),
              Text(
                subtitle,
                style: isRedColor != null
                    ? context.getFontText.labelSmall!.copyWith(color: AppColor.redColor)
                    : context.getFontText.labelSmall!.copyWith(color: AppColor.primaryTextBlackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyOrderTable extends StatelessWidget {
  const MyOrderTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              //color: AppColor.primaryColor,
            ),
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.015),
                child: const Text(
                  "From",
                  textAlign: TextAlign.start,
                  textScaleFactor: 0.9,
                  style: TextStyle(color: AppColor.primaryTextBlackColor, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.015),
                child: const Text(
                  "To",
                  textAlign: TextAlign.start,
                  textScaleFactor: 0.9,
                  style: TextStyle(color: AppColor.primaryTextBlackColor, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.015),
                child: const Text(
                  "Status",
                  textAlign: TextAlign.start,
                  textScaleFactor: 0.9,
                  style: TextStyle(color: AppColor.primaryTextBlackColor, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
        for (int i = 0; i < 4; i++)
          TableRow(children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.01),
              child: Text(
                "19 Apr, 2021",
                textAlign: TextAlign.start,
                style: context.getFontText.labelSmall!
                    .copyWith(color: AppColor.secondaryTextColor, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.01),
              child: Text(
                "22 Apr, 2021",
                textAlign: TextAlign.start,
                style: context.getFontText.labelSmall!
                    .copyWith(color: AppColor.secondaryTextColor, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: context.getScreenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Approved",
                    textAlign: TextAlign.start,
                    style: context.getFontText.labelSmall!
                        .copyWith(color: Colors.green, fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: AppColor.secondaryTextColor,
                  )
                ],
              ),
            ),
          ]),
      ],
    );
  }
}
