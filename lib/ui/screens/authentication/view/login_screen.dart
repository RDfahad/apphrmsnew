
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/authentication/view/signup_screen.dart';
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
        listener: (context, AuthenticationState state){
          if(state.loginSuccessfull){
          }
          else if(state.error){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.errorText),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthenticationCubit>()
                            .removeError();
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
        builder: (context,AuthenticationState state){
          return CustomLoaderWidget(
            isLoading: state.loginLoading,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white,Color(0xFF8194DD)], // Change the gradient colors as needed
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
  TextEditingController emailController = TextEditingController(text: 'test1@test.com');
  TextEditingController passwordController = TextEditingController(text: 'Test@123');
  @override
  Widget build(BuildContext context) {
    return Form(
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
            controller: emailController,
            validator: (v){
              String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              if(!RegExp(p).hasMatch(v.toString())){
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
              hintStyle: const TextStyle(color: Colors.grey), // Hint text color
              prefixIcon: const Icon(
                Icons.email_outlined, // Replace with your desired prefix icon
                color: Color(0xFFAC4FC6), // Prefix icon color
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                borderSide: BorderSide.none, // Remove the border line
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            style: TextStyle(color: context.getMainColor), //
            obscureText: true,
            // Text color
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Background color
              hintText: 'password',
              hintStyle: const TextStyle(color: Colors.grey), // Hint text color
              prefixIcon: const Icon(
                Icons.key, // Replace with your desired prefix icon
                color: Color(0xFFAC4FC6), // Prefix icon color
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16), // Padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                borderSide: BorderSide.none, // Remove the border line
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: context.getScreenWidth * 0.8,
            margin: EdgeInsets.only(bottom: context.getScreenWidth * 0.02),
            child: BlocBuilder(
              bloc: BlocProvider.of<AuthenticationCubit>(context),
              builder: (context, state){
                return ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      context.read<AuthenticationCubit>().loginUser(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFAC4FC6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Center(
              child: RichText(
              text: TextSpan(
              text: 'Don\'t have an account?', style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                TextSpan(text: ' Sign up', recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    // navigate to desired screen
                  } ,style: TextStyle(color: context.getMainColor, fontSize: 18)
                )])))
        ],
      ),
    );
  }
}