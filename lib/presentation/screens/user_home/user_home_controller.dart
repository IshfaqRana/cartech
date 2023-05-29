import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/models/vehicle_data_model.dart';

class UserHomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<VehicleDataModel> vehicles = [VehicleDataModel()].obs;

  getVehicleList(type) async {
    isLoading.value = true;
    vehicles.clear();
    final userRef =
        await FirebaseFirestore.instance.collection("car_agents").get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = userRef.docs;
    for (var document in documents) {
      Map<String, dynamic> userDataMap = document.data();
      VehicleDataModel vehicleDataModel = VehicleDataModel(
        name: userDataMap.entries
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
        uid: userDataMap.entries
            .firstWhere((element) => element.key == "uid")
            .value,
      );

      vehicles.add(vehicleDataModel);
    }
    isLoading.value = false;
  }
}
