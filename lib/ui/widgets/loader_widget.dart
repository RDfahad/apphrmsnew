import 'package:flutter/material.dart';
import '/utils/extension_methods.dart';

class CustomLoaderWidget extends StatelessWidget {
  final bool isLoading;
  final Widget? child;

  const CustomLoaderWidget(
      {Key? key, this.isLoading = false, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? Container(),
        Visibility(
          visible: isLoading ? true : false,
          child: WillPopScope(
            onWillPop: () async {
              return isLoading ? false : true;
            },
            child: AbsorbPointer(
              absorbing: isLoading ? true : false,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey.withOpacity(0.7),
                  child: Stack(
                    clipBehavior: Clip.none,
                    // overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(color: context.getMainColor,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}