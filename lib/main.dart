// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:cartech/presentation/screens/main_screens/main_screen_for_agents.dart';
import 'package:cartech/presentation/screens/main_screens/main_screen_for_users.dart';
import 'package:cartech/presentation/screens/starting/startup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Timer(const Duration(milliseconds: 500), () {
    FlutterNativeSplash.remove();
  });
  await Future.delayed(const Duration(milliseconds: 500));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isUser = false;
  bool isLoggedIn = false;
  if (prefs.getString("accessToken") != null) {
    isUser = prefs.getBool("user") ?? false;
    isLoggedIn = true;
  }

  runApp(MyApp(isUser: isUser, isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  bool isUser;
  bool isLoggedIn;
  MyApp({super.key, required this.isUser, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: isLoggedIn
            ? isUser
                ? const DashBoardScreenForUser()
                : const DashBoardScreenForAgents()
            : const StartupScreen(),
      );
    });
  }
}
