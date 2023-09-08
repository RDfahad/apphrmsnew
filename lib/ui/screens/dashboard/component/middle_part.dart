import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/screens/dashboard/component/container_card.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class GridViewScreenPart extends StatelessWidget {
  const GridViewScreenPart({
    super.key,
    required this.properties,
    required this.pageName,
  });

  final Map<String, String> properties;
  final List pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: context.getScreenHeight * 0.4,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ContainerCards(
              images: "assets/images/${properties.values.elementAt(index)}",
              title: properties.keys.elementAt(index),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => pageName[index]));
              },
            ),
          );
        },
      ),
    );
  }
}
