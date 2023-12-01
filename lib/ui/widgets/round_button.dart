import 'package:flutter/material.dart';
import '/utils/app_color.dart';
import '/utils/extension_methods.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.borderRadius = 10,
    this.loading = false,
    this.borderColor = AppColor.primaryColor,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final double borderRadius;
  final VoidCallback onPress;

  final Color? textColor, buttonColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor)),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          // fontWeight: FontWeight.bold,
                          color: textColor ?? AppColor.whiteColor),),),),
    );
  }
}

class RoundElevatedButton extends StatelessWidget {
  const RoundElevatedButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.whiteColor,
    required this.title,
    this.onPress,
    this.width = 60,
    this.height,
    this.borderRadius = 10,
    this.loading = false,
    this.fontStyle,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double? height;
  final double width;
  final double borderRadius;
  final VoidCallback? onPress;
  final FontStyle? fontStyle;

  final Color textColor, buttonColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height != null ? height : context.getScreenHeight * 0.06,
      child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),

                // side: BorderSide(color: Colors.red)
              ),
            ),
          ),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        // fontWeight: FontWeight.bold,
                        fontStyle:
                            fontStyle != null ? fontStyle : FontStyle.normal,
                        color: textColor),
                  ),
                )),
    );
  }
}
