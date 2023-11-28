import 'package:flutter/material.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        toolbarHeight: context.getScreenHeight * 0.078,
        leading: const Icon(
          Icons.arrow_back,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFFD9D9D9),
            ),
            SizedBox(
              width: context.getScreenWidth * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Derick Preach',
                  style: context.getFontText.titleMedium,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 3.2,
                      backgroundColor: Color(0xFF33AF4F),
                    ),
                    SizedBox(
                      width: context.getScreenWidth * 0.01,
                    ),
                    Text(
                      'Online',
                      style: context.getFontText.titleSmall,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: Image.asset(
              'assets/icons/call.png',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(children: [
          Container(
            height: 55,
            width: context.getScreenWidth * 0.55,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Please wait there',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '08:30 AM',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.45),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        height: context.getScreenHeight * 0.1,
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/emoji.png'),
            SizedBox(
              width: context.getScreenWidth * 0.08,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color(0xFFF2F2F2),
                  filled: true,
                  prefixIcon: Image.asset('assets/icons/camera.png'),
                  suffixIcon: Image.asset('assets/icons/send.png'),
                  hintText: 'Type Message',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      34,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      34,
                    ),
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
