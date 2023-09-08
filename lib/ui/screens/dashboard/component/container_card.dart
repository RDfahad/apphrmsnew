import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class ContainerCards extends StatelessWidget {
  const ContainerCards({
    super.key,
    required this.images,
    required this.title,
    required this.onPressed,
  });
  final String images;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(47, 125, 121, 0.3),
              offset: Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 6,
            ),
          ],
          color: AppColor.whiteColor,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(images),
              SizedBox(height: context.getScreenHeight * 0.02),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
