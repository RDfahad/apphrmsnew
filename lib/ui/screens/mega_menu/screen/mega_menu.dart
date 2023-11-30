import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/screens/form_overview/view/form_screen.dart';
import 'package:hr_emp_proj/utils/helper.dart';
import '/utils/app_color.dart';
import '../../../widgets/icon-card.dart';
import '/utils/extension_methods.dart';

final List listIcon = [
  Icons.calendar_month,
  Icons.layers_outlined,
  Icons.chat,
  Icons.warning_rounded,
  Icons.copy,
];
final List listIconName = [
  "Forms",
  "Policies",
  "Requests",
  "Offenses",
  "Documnents",
];

class MegaMenuScreen extends StatelessWidget {
  const MegaMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.getScreenHeight * 0.25,
              child: Stack(
                children: [
                  // Icon(Icons.cancel_outlined),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(
                        horizontal: context.getScreenWidth * 0.03,
                        vertical: context.getScreenHeight * 0.02),
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
                    width: double.infinity,
                    child: const Text(
                      "Mega Menu",
                      style: TextStyle(
                          color: AppColor.primaryTextWhiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.0, top: context.getScreenHeight * 0.03),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset('assets/images/cancel_icon.png')),
                    ),
                  ),
                  Positioned(
                    top: context.getScreenHeight * 0.15,
                    right: context.getScreenHeight * 0.05,
                    child: Container(
                      height: context.getScreenHeight * 0.08,
                      width: context.getScreenHeight * 0.08,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFd9d9d9),
                        border: Border.all(
                          color: AppColor.whiteColor,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            color: Colors.grey.shade200,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "General",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.getScreenHeight * 0.01),
            Wrap(
              spacing: context.getScreenWidth * 0.06,
              children: List.generate(
                5,
                (index) => IconCard(
                  iconData: listIcon[index],
                  iconName: listIconName[index],
                  iconSize: 28,
                ),
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.01),
            const Text(
              "Policies & Forms",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.getScreenHeight * 0.01),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FormScreen(),
                      ));
                    },
                    child: IconCard(
                      iconData: listIcon[index],
                      iconName: listIconName[index],
                      iconSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.getScreenHeight * 0.01),
            const Text(
              "Payroll Management",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.getScreenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconCard(
                    iconData: listIcon[index],
                    iconName: listIconName[index],
                    iconSize: 28,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
