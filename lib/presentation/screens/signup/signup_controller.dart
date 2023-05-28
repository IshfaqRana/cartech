// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cartech/presentation/screens/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/app_utils.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxBool powerLock = false.obs;
  RxBool powerWindow = false.obs;
  RxBool isAC = false.obs;
  RxBool powerStearing = false.obs;
  RxBool isAuto = false.obs;
  RxBool airBags = false.obs;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Rx<XFile>? imageList;
  List<String> vehicleClass = [
    "Select Category",
    "CLASS A PICK-UP",
    "CLASS B PICK-UP",
    "CLASS C PICK-UP",
    "CLASS D PICK-UP",
    "CLASS E PICK-UP"
  ];
  RxString selectedClass = "Select Category".obs;

  signup(
    String email,
    String password,
    String name,
    String phone,
    String address,
    String city,
    int seats,
    String vehicleName,
    int price,
    bool user,
    BuildContext context,
    File image,
  ) async {
    isLoading.value = true;
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user) {
        final usersCollection = FirebaseFirestore.instance.collection("users");
        await usersCollection.doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'password': password,
          'uid': userCredential.user!.uid
        });
      } else {
        final usersCollection =
            FirebaseFirestore.instance.collection("car_agents");
        await usersCollection.doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'password': password,
          "phone": phone,
          "address": address,
          "city": city,
          "seats": seats,
          "category": selectedClass.value,
          "vehicle_name": vehicleName,
          "price": price,
          "powerLock": powerLock.value,
          "powerStearing": powerStearing.value,
          "powerWindow": powerWindow.value,
          "ac": isAC.value,
          "automatic": isAuto.value,
          "air_bags": airBags.value,
          "url": "",
          'uid': userCredential.user!.uid
        });
        uploadImages(image, userCredential.user!.uid);
      }

      Utils.showToasts(context, 'Signup Successfully');
      // User signed up
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showToasts(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.showToasts(context, 'The account already exists for that email.');
      }
    } catch (e) {
      Utils.showToasts(context, 'Error creating user:  $e');
    }

    isLoading.value = false;
    Get.to(() => LoginView(user: user));
  }

  Future<void> uploadImages(File images, String userID) async {
    Utils.printDebug("Path: ${images.path}");
    final storageRef = _storage.ref().child('images/${DateTime.now()}.jpg');

    final uploadTask = await storageRef.putFile(images);
    final downloadUrl = await uploadTask.ref.getDownloadURL();
    final carAgentDoc =
        FirebaseFirestore.instance.collection('car_agents').doc(userID);
    // final carImagesField = carAgentDoc.collection('car_images');
    await carAgentDoc.update({'url': downloadUrl});
  }

  Future<bool> requestFilesPermission(BuildContext context) async {
    if (await Permission.storage.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
                'Storage permission is required to proceed. Please enable it in the device settings.'),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                  child: const Text("Open Setting"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    openAppSettings();
                  }),
            ],
          );
        },
      );
      return false;
    } else {
      var status = await Permission.storage.request();
      return status.isGranted;
    }
  }
}
