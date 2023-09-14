import 'package:flutter/material.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class HeadPart extends StatelessWidget {
  const HeadPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue background with rounded corners
        Container(
          width: double.infinity,
          height: context.getScreenHeight * 0.11,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
        ),
        // Card with balance information
        Positioned(
          top: context.getScreenHeight * 0.01,
          left: context.getScreenWidth * 0.03, //context.getScreenWidth / 11, //37,
          right: context.getScreenWidth * 0.03,
          child: Container(
            height: context.getScreenHeight * 0.24, //170,
            width: context.getScreenWidth,
            // margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.05),//320,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(47, 125, 121, 0.3),
                  offset: Offset(0, 1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Total Balance title and more options icon
                const ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.amber,
                  ),
                  title: Text(
                    "Indigo Violet",
                    style: TextStyle(fontSize: 14),
                  ),
                  subtitle: Text(
                    "General Coordinator",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(height: context.getScreenHeight * .012),
                const Divider(
                  height: 1,
                  thickness: 0.4,
                  color: AppColor.secondaryTextColor,
                ),
                SizedBox(height: context.getScreenHeight * .012),
                // Total balance amount
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.getScreenWidth * .02),
                  child: const Column(
                    children: [
                      CardRow(title: "Emp Code:", text: "21EWO98D"),
                      CardRow(title: "Email:", text: "indigo@email.com"),
                      CardRow(
                          title: "Reporting Manager:", text: "Mr.Eric Widget"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CardRow extends StatelessWidget {
  final String title;
  final String text;
  const CardRow({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: AppColor.secondaryTextColor,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColor.primaryTextBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
