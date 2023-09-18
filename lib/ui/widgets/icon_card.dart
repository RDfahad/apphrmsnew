import 'package:flutter/material.dart';

////this is reusbale
class CustomProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final IconData? icon;
  final double cardHeight;
  final double profileImageSize;

  const CustomProfileCard({
    Key? key,
    required this.name,
    required this.title,
    this.icon,
    required this.cardHeight,
    required this.profileImageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: cardHeight * 0.03),
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
              ),
            ),
            height: cardHeight * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: icon != null ? 14 : 28,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: cardHeight * 0.02,
                ),
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: cardHeight * 0.6,
            right: cardHeight * 0.03,
            child: Container(
              height: profileImageSize,
              width: profileImageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFd9d9d9),
                border: Border.all(
                  color: Colors.white,
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
    );
  }
}
