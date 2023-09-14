import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/utils/extension_methods.dart';

import '../../../widgets/loader_widget.dart';
import '../bloc/authentication_bloc.dart';
import '../bloc/authentication_state.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer(
      bloc: BlocProvider.of<AuthenticationCubit>(context),
      listener: (context, AuthenticationState state) {
        if (state.signUpSuccessfull) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text('sign up user successfully'),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().removeError();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAC4FC6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              );
            },
          );
        } else if (state.error) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(state.errorMessage.toString()),
                actions: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthenticationCubit>().removeError();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAC4FC6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
          isLoading: state.signUpLoading,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Color(0xFF8194DD)
                ], // Change the gradient colors as needed
              ),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: SignUpForm(),
              ),
            ),
          ),
        );
      },
    ));
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              width: context.getScreenWidth * 0.3,
              height: context.getScreenHeight * 0.2,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: firstNameController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'invalid input';
                }
                return null;
              },
              style: TextStyle(color: context.getMainColor), //
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                hintText: 'first name',
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(
                  Icons.person_2, // Replace with your desired prefix icon
                  color: Color(0xFFAC4FC6), // Prefix icon color
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16), // Padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the border line
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              validator: (v) {
                if (v!.isEmpty) {
                  return 'invalid input';
                }
                return null;
              },
              style: TextStyle(color: context.getMainColor), //
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                hintText: 'last name',
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(
                  Icons.person_2, // Replace with your desired prefix icon
                  color: Color(0xFFAC4FC6), // Prefix icon color
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16), // Padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the border line
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              validator: (v) {
                String p =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                if (!RegExp(p).hasMatch(v.toString())) {
                  return 'invalid email';
                }
                return null;
              },
              style: TextStyle(color: context.getMainColor), //
              // Text color
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                hintText: 'email',
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(
                  Icons.email_outlined, // Replace with your desired prefix icon
                  color: Color(0xFFAC4FC6), // Prefix icon color
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16), // Padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the border line
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              validator: (v) {
                if (v!.length < 8) {
                  return 'password should contain at least 8 character long';
                }
                return null;
              },
              style: TextStyle(color: context.getMainColor), //
              obscureText: true,
              // Text color
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                hintText: 'password',
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(
                  Icons.key, // Replace with your desired prefix icon
                  color: Color(0xFFAC4FC6), // Prefix icon color
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16), // Padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the border line
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: confirmPasswordController,
              validator: (v) {
                if (v.toString() != passwordController.text) {
                  return 'password does not match';
                }
                return null;
              },
              style: TextStyle(color: context.getMainColor), //
              obscureText: true,
              // Text color
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // Background color
                hintText: 'confirm password',
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
                prefixIcon: const Icon(
                  Icons.key, // Replace with your desired prefix icon
                  color: Color(0xFFAC4FC6),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 16), // Padding
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Adjust the border radius as needed
                  borderSide: BorderSide.none, // Remove the border line
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: context.getScreenWidth * 0.8,
              child: BlocBuilder(
                bloc: BlocProvider.of<AuthenticationCubit>(context),
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAC4FC6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the radius as needed
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
