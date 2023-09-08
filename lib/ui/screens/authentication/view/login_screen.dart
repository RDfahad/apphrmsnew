// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hr_emp_proj/ui/screens/authentication/view/signup_screen.dart';
// import 'package:hr_emp_proj/ui/widgets/round_button.dart';
// import 'package:hr_emp_proj/utils/app_color.dart';
// import 'package:hr_emp_proj/utils/extension_methods.dart';
// import '../../../widgets/loader_widget.dart';
// import '../bloc/authentication_bloc.dart';
// import '../bloc/authentication_state.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer(
//         bloc: BlocProvider.of<AuthenticationCubit>(context),
//         listener: (context, AuthenticationState state) {
//           if (state.loginSuccessfull) {
//           } else if (state.error) {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Error'),
//                   content: Text(state.errorText),
//                   actions: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         context.read<AuthenticationCubit>().removeError();
//                         Navigator.of(context).pop();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: context.getMainColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(
//                               8.0), // Adjust the radius as needed
//                         ),
//                       ),
//                       child: const Text(
//                         'Close',
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     )
//                   ],
//                 );
//               },
//             );
//           }
//         },
//         builder: (context, AuthenticationState state) {
//           return CustomLoaderWidget(
//             isLoading: state.loginLoading,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     context.getMainColor,
//                     context.getSecondaryColor
//                   ], // Change the gradient colors as needed
//                 ),
//               ),
//               child: const Center(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: LoginForm(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   _LoginFormState createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController =
//       TextEditingController(text: 'test1@test.com');
//   TextEditingController passwordController =
//       TextEditingController(text: 'Test@123');
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             "assets/images/R.png",
//             height: 200,
//           ),
//           const SizedBox(height: 30),
//           TextFormField(
//             controller: emailController,
//             validator: (v) {
//               String p =
//                   r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//               if (!RegExp(p).hasMatch(v.toString())) {
//                 return 'invalid email';
//               }
//               return null;
//             },
//             style: TextStyle(color: context.getMainColor), //
//             // Text color
//             decoration: InputDecoration(
//               label:
//                   Text("Email", style: TextStyle(color: AppColor.primeryColor)),
//               // filled: true,
//               // fillColor: Colors.white, // Background color
//               hintText: 'email',
//               hintStyle: const TextStyle(color: Colors.grey), // Hint text color

//               contentPadding: const EdgeInsets.symmetric(
//                   vertical: 14, horizontal: 20), // Padding
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                     8), // Adjust the border radius as needed
//                 //borderSide: BorderSide.none, // Remove the border line
//               ),
//             ),
//           ),
//           SizedBox(height: context.getScreenHeight * 0.019),
//           TextFormField(
//             controller: passwordController,
//             style: TextStyle(color: context.getMainColor), //
//             obscureText: true,

//             // Text color
//             decoration: InputDecoration(
//               label: Text("Password",
//                   style: TextStyle(color: AppColor.primeryColor)),
//               suffixIcon: Icon(
//                 Icons.fingerprint_sharp,
//                 fill: 1,
//                 size: 25,
//               ),

//               //filled: true,
//               // fillColor: Colors.white, // Background color
//               hintText: 'password',
//               hintStyle: const TextStyle(color: Colors.grey), // Hint text color

//               contentPadding: const EdgeInsets.symmetric(
//                   vertical: 14, horizontal: 20), // Padding
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(
//                     8), // Adjust the border radius as needed
//                 //  borderSide: BorderSide.none, // Remove the border line
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           RoundButton(
//               height: context.getScreenHeight * 0.05,
//               width: context.getScreenHeight * 0.15,
//               borderRadius: 50,
//               title: 'Login',
//               onPress: () {
//                 if (_formKey.currentState!.validate()) {
//                   context.read<AuthenticationCubit>().loginUser(
//                       email: emailController.text,
//                       password: passwordController.text);
//                 }
//               }),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/widgets/round_button.dart';
import 'package:hr_emp_proj/utils/app_color.dart';
import 'package:hr_emp_proj/utils/extension_methods.dart';
import '../../../widgets/loader_widget.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: BlocProvider.of<AuthenticationCubit>(context),
        listener: (context, AuthenticationState state) {
          if (state.loginSuccessfull) {
            // Handle successful login
          } else if (state.error) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.errorText),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthenticationCubit>().removeError();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.getMainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.whiteColor),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
        builder: (context, AuthenticationState state) {
          return CustomLoaderWidget(
            isLoading: state.loginLoading,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.getMainColor,
                    context.getSecondaryColor,
                  ],
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: LoginForm(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: 'test1@test.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@123');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.getScreenHeight * 0.1),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Image.asset(
              "assets/images/R.png",
              height: 200,
            ),
          ),
          SizedBox(height: context.getScreenHeight * 0.02),
          TextFormField(
            controller: emailController,
            validator: (v) {
              String p =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              if (!RegExp(p).hasMatch(v.toString())) {
                return 'Invalid email';
              }
              return null;
            },
            style: TextStyle(color: AppColor.whiteColor),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  // Add this to set border color
                  color: AppColor.whiteColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Email",
              labelStyle:
                  const TextStyle(color: AppColor.whiteColor, fontSize: 17),
              hintText: 'Email',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: context.getScreenHeight * 0.03),
          TextFormField(
            controller: passwordController,
            style: TextStyle(color: AppColor.whiteColor),
            obscureText: true,
            decoration: InputDecoration(
              fillColor: AppColor.whiteColor,
              labelText: "Password",
              labelStyle:
                  const TextStyle(color: AppColor.whiteColor, fontSize: 17),
              suffixIcon: const Icon(
                Icons.fingerprint_sharp,
                size: 25,
                color: AppColor.whiteColor,
              ),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  // Add this to set border color
                  color: AppColor.whiteColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: context.getScreenHeight * 0.05),
          RoundButton(
            height: context.getScreenHeight * 0.05,
            width: context.getScreenWidth * 0.4,
            borderRadius: 50,
            title: 'Login',
            onPress: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthenticationCubit>().loginUser(
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
          ),
          SizedBox(height: context.getScreenHeight * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: context.getScreenWidth * 0.2,
                color: AppColor.primaryColor,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'OR',
                  style: TextStyle(color: AppColor.primaryColor),
                ),
              ),
              Container(
                height: 2,
                width: context.getScreenWidth * 0.2,
                color: AppColor.primaryColor,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: context.getScreenHeight * 0.04),
            child: Text(
              'Forget Password',
              style: TextStyle(color: AppColor.whiteColor),
            ),
          ),
        ],
      ),
    );
  }
}
