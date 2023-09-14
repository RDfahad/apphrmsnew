import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import '/ui/screens/onboarding/bloc/onboarding_bloc.dart';
import '/ui/screens/onboarding/view/onboarding_screen.dart';
import 'data/http/http.dart';
import 'data/repository_implement/authentication_repo_impl/authentication_repo_implement.dart';
import 'domain/repository/authentication_repo/authentication_repo.dart';
import 'ui/screens/authentication/view/login_screen.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // HTTPRequest().post(url: 'url');
  getIt.registerSingleton(ResponseHandler());
  getIt.registerSingleton(HTTPRequest());
  getIt.registerSingleton<AuthenticationRepo>(
      AuthenticationRepoImpl(httpRequest: getIt()));

  //Hive DataBase

  await Hive.initFlutter();
  await Hive.openBox("UserData");
  // Running App
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => OnboardingCubit()..init()),
        BlocProvider(create: (BuildContext context) => BottomNavigationCubit()),
        BlocProvider(
            create: (BuildContext context) => AuthenticationCubit(getIt())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Typography.blackCupertino,
        primaryColor: const Color(0xFF1A2980),
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF1A2980),
            onPrimary: Color(0xFF1A2980),
            secondary: Color(0xFF26D0CE),
            onSecondary: Color(0xFF1A2980),
            error: Color(0xFF1A2980),
            onError: Color(0xFF1A2980),
            background: Colors.white,
            onBackground: Color(0xFF1A2980),
            surface: Color(0xFF1A2980),
            onSurface: Color(0xFF1A2980)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

// https://shibuiyusuke.medium.com/measuring-distance-with-arcore-6eb15bf38a8f
