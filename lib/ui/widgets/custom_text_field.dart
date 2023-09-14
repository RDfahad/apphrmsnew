// import 'package:flutter/material.dart';
// import '/utils/app_color.dart';

// class CustomTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData? suffixIcon;
//   final IconData preffixIcon;
//   final String hintText;
//   final double borderRadius;

//   CustomTextFormField({
//     required this.controller,
//     required this.labelText,
//     this.suffixIcon,
//     required this.hintText,
//     this.borderRadius = 8.0,
//     required this.preffixIcon,
//   });

//   bool isVisibleSuffixIcons = false;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       style: TextStyle(color: AppColor.blackColor),
//       decoration: InputDecoration(
//         fillColor: AppColor.whiteColor,
//         filled: true,
//         labelText: labelText,
//         labelStyle: const TextStyle(color: AppColor.blackColor, fontSize: 17),
//         prefixIcon: Icon(
//           preffixIcon,
//           size: 25,
//           color: AppColor.secondaryTextColor,
//         ),
//         suffixIcon: suffixIcon != null
//             ? isVisibleSuffixIcons
//                 ? Icon(
//                     suffixIcon,
//                     size: 25,
//                     color: AppColor.secondaryTextColor,
//                   )
//                 : Icon(
//                     Icons.visibility_off,
//                     size: 25,
//                     color: AppColor.secondaryTextColor,
//                   )
//             : null,
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.grey),
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//         border: OutlineInputBorder(
//           // borderSide: const BorderSide(
//           //   color: AppColor.blackColor,
//           //   width: 2.0,
//           // ),
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         errorBorder: const OutlineInputBorder(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? suffixIcon;
  final IconData preffixIcon;
  final String hintText;
  final double borderRadius;
  final Color errorColor;
  final bool isIconColorChange;
  final Function(String) onChange;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    required this.hintText,
    this.borderRadius = 8.0,
    required this.preffixIcon,
    this.errorColor = Colors.red,
    required this.onChange,
    required this.isIconColorChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                spreadRadius: 8,
                color: AppColor.secondaryButtonColor,
                blurRadius: 10),
          ],
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
              color: AppColor.blackColor,
            ),
            hintText: labelText,
            hintStyle: const TextStyle(
              color: AppColor.blackColor,
            ),
            prefixIcon: Icon(
              preffixIcon,
              color: isIconColorChange
                  ? AppColor.primaryColor
                  : AppColor.secondaryTextColor,
            ),
            errorStyle: TextStyle(
              color: errorColor,
            ),
          ),
          onChanged: onChange,
        ));
  }
}

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField({
    super.key,
    required ValueNotifier<bool> obsecurePassword,
    required this.controller,
    required this.isIconColorChange,
  }) : _obsecurePassword = obsecurePassword;

  final ValueNotifier<bool> _obsecurePassword;
  final TextEditingController controller;
  final bool isIconColorChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              spreadRadius: 16,
              color: AppColor.secondaryButtonColor,
              blurRadius: 16),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: _obsecurePassword,
        builder: (context, value, child) {
          return TextFormField(
            style: TextStyle(color: AppColor.blackColor),
            obscureText: _obsecurePassword.value,
            obscuringCharacter: "*",
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Password",
              labelStyle: const TextStyle(
                color: AppColor.blackColor,
              ),
              hintText: "password",
              hintStyle: const TextStyle(
                color: AppColor.blackColor,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: isIconColorChange
                    ? AppColor.primaryColor
                    : AppColor.secondaryTextColor,
              ),
              suffixIcon: InkWell(
                  onTap: () {
                    _obsecurePassword.value = !_obsecurePassword.value;
                  },
                  child: Icon(
                    _obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    size: 25,
                    color: AppColor.secondaryTextColor,
                  )),
            ),
            onChanged: (value) {
              context.read<AuthenticationCubit>().checkButtonEnabledDisabled();
            },
          );
        },
      ),
    );
  }
}
