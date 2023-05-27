import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/models/vehicle_data_model.dart';
import '../../../utils/app_utils.dart';

class AgentHomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<VehicleDataModel> vehicle = VehicleDataModel().obs;

  getInitialValue() async {
    isLoading.value = true;
    final currentUser = FirebaseAuth.instance.currentUser;
    final uid = currentUser!.uid;

    final userRef =
        FirebaseFirestore.instance.collection("car_agents").doc(uid);

    final userData = await userRef.get();

    if (userData.exists) {
      final userDataMap = userData.data();
      vehicle.value = VehicleDataModel(
        name: userDataMap!.entries
            .firstWhere((element) => element.key == "name")
            .value,
        email: userDataMap.entries
            .firstWhere((element) => element.key == "email")
            .value,
        password: userDataMap.entries
            .firstWhere((element) => element.key == "password")
            .value,
        phone: userDataMap.entries
            .firstWhere((element) => element.key == "phone")
            .value,
        address: userDataMap.entries
            .firstWhere((element) => element.key == "address")
            .value,
        city: userDataMap.entries
            .firstWhere((element) => element.key == "city")
            .value,
        seats: userDataMap.entries
            .firstWhere((element) => element.key == "seats")
            .value,
        category: userDataMap.entries
            .firstWhere((element) => element.key == "category")
            .value,
        vehicleName: userDataMap.entries
            .firstWhere((element) => element.key == "vehicle_name")
            .value,
        price: userDataMap.entries
            .firstWhere((element) => element.key == "price")
            .value,
        powerLock: userDataMap.entries
            .firstWhere((element) => element.key == "powerLock")
            .value,
        powerStearing: userDataMap.entries
            .firstWhere((element) => element.key == "powerStearing")
            .value,
        powerWindow: userDataMap.entries
            .firstWhere((element) => element.key == "powerWindow")
            .value,
        ac: userDataMap.entries
            .firstWhere((element) => element.key == "ac")
            .value,
        airBags: userDataMap.entries
            .firstWhere((element) => element.key == "air_bags")
            .value,
        automatic: userDataMap.entries
            .firstWhere((element) => element.key == "automatic")
            .value,
        url: userDataMap.entries
            .firstWhere((element) => element.key == "url")
            .value,
      );
      Utils.printDebug(vehicle.value);
    }

    isLoading.value = false;
  }
}
