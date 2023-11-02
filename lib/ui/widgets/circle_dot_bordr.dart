
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

import '../../utils/app_color.dart';

class CircularDotsProgress extends StatelessWidget {
  const CircularDotsProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 10,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: context.getScreenWidth * 0.15,
            height: context.getScreenWidth * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.primaryColor.withOpacity(0.12),
                width: 6,
              ),
            ),
          ),
          const Positioned(
            top: 0,
            child: Dot(),
          ),
          const Positioned(
            bottom: 0,
            child: Dot(),
          ),
          const Positioned(
            left: 0,
            child: Dot(),
          ),
          const Positioned(
            right: 0,
            child: Dot(),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getScreenWidth * 0.017,
      height: context.getScreenWidth * 0.017,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primaryColor,
      ),
    );
  }
}