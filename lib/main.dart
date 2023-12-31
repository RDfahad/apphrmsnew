import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hr_emp_proj/data/repository_implement/document_management_implementation/document_management_impl.dart';
import 'package:hr_emp_proj/data/repository_implement/profile_repo_impl/profile_repo_impl.dart';
import 'package:hr_emp_proj/data/repository_implement/request_repo_impl/request_repo_impl.dart';
import 'package:hr_emp_proj/domain/repository/document_management/document_management_repo.dart';
import 'package:hr_emp_proj/domain/repository/profile_repo/profile_repo.dart';
import 'package:hr_emp_proj/domain/repository/request_repo/request_repo.dart';
import 'package:hr_emp_proj/ui/screens/document_overview.dart/document_bloc/document_bloc.dart';

import '/data/repository_implement/attendence_repo_impl/attendance_repo_implement.dart';
import '/domain/repository/attendance_repo/attendance_repo.dart';
import '/ui/screens/attendance/cubit/attendance_cubit.dart';
import '/ui/screens/authentication/bloc/authentication_bloc.dart';
import '/ui/screens/dashboard/bloc/dashboard_bloc.dart';
import '/ui/screens/onboarding/bloc/onboarding_bloc.dart';
import '/ui/screens/onboarding/view/onboarding_screen.dart';
import '/ui/screens/profile/bloc/profile_bloc.dart';
import '/utils/app_color.dart';
import 'data/http/http.dart';
import 'data/repository_implement/authentication_repo_impl/authentication_repo_implement.dart';
import 'domain/repository/authentication_repo/authentication_repo.dart';
import 'ui/screens/request_overview/cubit/request_overview_cubit.dart';

final GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(ResponseHandler());
  getIt.registerSingleton(HTTPRequest());
  getIt.registerSingleton<AuthenticationRepo>(
      AuthenticationRepoImpl(httpRequest: getIt()));
  getIt.registerSingleton<AttendanceRepo>(
      AttendanceRepoImpl(httpRequest: getIt()));
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(httpRequest: getIt()));
  getIt.registerSingleton<RequestRepo>(RequestRepoImpl(httpRequest: getIt()));
  getIt.registerSingleton<DocumentManagementRepo>(
      DocumentManagementRepoImpl(httpRequest: getIt()));
  //Hive DataBase
  await Hive.initFlutter();
  await Hive.openBox("UserData");
  // Running App
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => OnboardingCubit()..init()),
        BlocProvider(
            create: (BuildContext context) => AuthenticationCubit(getIt())),
        BlocProvider(
            create: (BuildContext context) => DashboardCubit(getIt(), getIt())),
        BlocProvider(
            create: (BuildContext context) => AttendanceCubit(getIt())),
        BlocProvider(
            create: (BuildContext context) => AttendanceCubit(getIt())),
        BlocProvider(create: (BuildContext context) => ProfileCubit(getIt())),
        BlocProvider(
            create: (BuildContext context) => RequestOverviewCubit(getIt())),
        BlocProvider(
            create: (BuildContext context) =>
                DocumentCubit(getIt())..getDocument()),
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
        //fontFamily: "Poppins",
        focusColor: AppColor.blackColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColor.primaryTextBlackColor,
              displayColor: AppColor.primaryTextBlackColor,
              fontFamily: "Poppins",
            ),
        // primaryColor: Color(0xFF4684e2),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF4684e2),
          onPrimary: Color(0xFF4684e2),
          secondary: Color(0xFF26D0CE),
          onSecondary: Color(0xFF1A2980),
          error: Color(0xFF1A2980),
          onError: Color(0xFF1A2980),
          background: AppColor.secondaryButtonColor,
          onBackground: Color(0xFF1A2980),
          surface: Color(0xFF1A2980),
          onSurface: Color(0xFF1A2980),
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

// https://shibuiyusuke.medium.com/measuring-distance-with-arcore-6eb15bf38a8f
