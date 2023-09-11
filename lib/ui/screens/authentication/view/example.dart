import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hr_emp_proj/ui/widgets/round_button.dart';
import 'package:hr_emp_proj/utils/custom_text_field.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';

class LoginScreen2 extends StatelessWidget {
  LoginScreen2({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[200], // Change to your desired background color
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 200, // Adjust this as needed
              width: double.infinity,
              color: Colors.blue, // Change to your desired background color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/icons/login_icon.png"),
                  const SizedBox(height: 10),
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              preffixIcon: Icons.email,
              controller: emailController,
              labelText: "Email",
              hintText: "Email",
              borderRadius: 25,
              onChange: (val) {},
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    style: const TextStyle(color: Colors.black),
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
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
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue, // Change to your desired text color
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.red, // Change to your desired icon color
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "There is something wrong with your login credentials, please double-check and try again.",
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Colors.red, // Change to your desired text color
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing after warning message
              ],
            ),
            RoundButton(
              title: "Sign In",
              onPress: () {},
              width: double.infinity,
              borderRadius: 25,
            ),
            SizedBox(height: context.getScreenHeight * 0.02),
          ],
        ),
      ),
    );
  }
}
