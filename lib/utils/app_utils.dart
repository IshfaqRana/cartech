import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/screens/starting/welcome_page.dart';

class Utils {
  static printDebug(data) {
    if (kDebugMode) {
      print(data);
    }
  }

  loader() => const SizedBox(
        height: 15,
        width: 15,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );

  static FToast fToast = FToast();

  static Widget toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Text(text),
    );
  }

  static showNormalToasts(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );
  }

  static showToasts(BuildContext context, String text) {
    showToast(
      text,
      context: context,
      axis: Axis.horizontal,
      alignment: Alignment.bottomCenter,
      position: StyledToastPosition.bottom,
      duration: const Duration(seconds: 5),
    );
  }

  Future<void> logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("apple-email") ?? "";
    if (prefs.getBool("google-sign-in") ?? false) {
      // Authentication.signOut(context: context);
    }
    prefs.clear();

    prefs.setString("apple-email", email);
  }

  static Future<void> setSharedPrefs(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> setSharedPrefsBool(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static void signOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await FirebaseAuth.instance.signOut();
      prefs.clear();
      // ignore: use_build_context_synchronously
      showToasts(context, 'User signed out successfully.');
      Get.to(() => const WelcomePage());
    } catch (e) {
      showToast('Error signing out: $e');
    }
  }

  static String readTimestamp(int timestamp) {
    DateTime now = DateTime.now();
    var format = DateFormat('HH:mm a');
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';
    bool condition1 = (diff.inSeconds > 0 && diff.inMinutes == 0);
    bool condition2 = (diff.inMinutes > 0 && diff.inHours == 0);
    bool condition3 = ((diff.inHours > 0 && diff.inDays == 0));
    if (condition1) {
      time = 'Now';
    } else if (condition2) {
      time = '${diff.inMinutes} Minutes AGO';
    } else if (condition3) {
      time = '${diff.inHours} Hours AGO';
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} DAY AGO';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        time = '${(diff.inDays / 7).floor()} WEEKS AGO';
      }
    }

    return time;
  }
}
