import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? suffixIcon;
  final IconData prefixIcon;
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
    required this.prefixIcon,
    this.errorColor = Colors.red,
    required this.onChange,
    required this.isIconColorChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.getScreenWidth * 0.02),
        width: double.infinity,
        height: context.getScreenHeight * 0.08,
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
              prefixIcon,
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
      height: context.getScreenHeight * 0.08,
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
            style: const TextStyle(color: AppColor.blackColor),
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType textType;
  final Function(String) onChange;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.textType = TextInputType.text,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      onChanged: onChange,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}

class CustomPasswordTextField1 extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType textType;
  final Function(String) onChange;

  const CustomPasswordTextField1({
    super.key,
    required ValueNotifier<bool> obsecurePassword,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    this.textType = TextInputType.text,
    required this.onChange,
  }) : _obsecurePassword = obsecurePassword;

  final ValueNotifier<bool> _obsecurePassword;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obsecurePassword,
      builder: (context, value, child) {
        return TextFormField(
          obscureText: _obsecurePassword.value,
          controller: controller,
          keyboardType: textType,
          decoration: InputDecoration(
              suffixIcon: InkWell(
                  onTap: () {
                    _obsecurePassword.value = !_obsecurePassword.value;
                  },
                  child: Icon(
                    _obsecurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    size: 28,
                    color: AppColor.secondaryTextColor,
                  )),
              hintText: hintText,
              border: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black38,
              )),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black38,
              ))),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your $hintText';
            }
            return null;
          },
          maxLines: maxLines,
          onChanged: onChange,
        );
      },
    );
  }
}
