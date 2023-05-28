// ignore_for_file: use_build_context_synchronously

import 'package:cartech/presentation/screens/main_screens/main_screen_for_agents.dart';
import 'package:cartech/presentation/screens/main_screens/main_screen_for_users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_utils.dart';
import '../agent_home/agent_home_screen.dart';
import '../user_home/user_home_screen.dart';

class LoginController extends GetxController {
  RxBool isVisible = false.obs;
  RxBool isLoading = false.obs;

  login(
      String email, String password, bool isUser, BuildContext context) async {
    isLoading.value = true;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!isUser) {
        Utils.setSharedPrefs("accessToken",
            userCredential.credential?.accessToken ?? "accesToken");
        Utils.setSharedPrefsBool("user", false);
        Get.offAll(() => const DashBoardScreenForAgents());
      } else {
        Utils.setSharedPrefs("accessToken",
            userCredential.credential?.accessToken ?? "accesToken");
        Utils.setSharedPrefsBool("user", true);
        Get.offAll(() => const DashBoardScreenForUser());
      }
      Utils.showToasts(context, "Logged in Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.showToasts(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils.showToasts(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      Utils.showToasts(context, 'Error signing in with email and password: $e');
    }
    isLoading.value = false;
  }

  Future<bool> isUserPresent(String uid) async {
    final usersCollection = FirebaseFirestore.instance.collection('car_agents');
    final querySnapshot =
        await usersCollection.where('uid', isEqualTo: uid).get();

    return querySnapshot.docs.isNotEmpty;
  }
}
