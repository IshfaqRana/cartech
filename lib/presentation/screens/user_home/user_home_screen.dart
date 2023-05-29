import 'package:cartech/data/models/vehicle_data_model.dart';
import 'package:cartech/presentation/screens/user_home/user_home_controller.dart';
import 'package:cartech/presentation/screens/vehicle_information/vehicle_information.dart';
import 'package:cartech/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/text_styles.dart';

class UserHomeScreen extends StatefulWidget {
  final String type;
  const UserHomeScreen({Key? key, required this.type}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  UserHomeController userHomeController = Get.put(UserHomeController());

  @override
  void initState() {
    userHomeController.getVehicleList(widget.type);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            "Available Vehicles",
            textAlign: TextAlign.center,
            style: AppTextStyles.regBlack12Bold,
          ),
        ),
        body: userHomeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(AppColors.kAppBGColor),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Column(children: [
                    SizedBox(
                      height: 83.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userHomeController.vehicles.length,
                          itemBuilder: (context, index) {
                            VehicleDataModel vehicle =
                                userHomeController.vehicles[index];
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() =>
                                        VehicleInformation(vehicle: vehicle));
                                  },
                                  child: Container(
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.kWhite,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(1.0.h),
                                          topRight: Radius.circular(1.0.h)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFF000000)
                                              .withOpacity(0.04),
                                          blurRadius: 0.5.h,
                                          spreadRadius: 0.2.h,
                                          offset: Offset(0.5.h, 0.5.h),
                                        ),
                                        BoxShadow(
                                          color: const Color(0xFF000000)
                                              .withOpacity(0.04),
                                          blurRadius: 1.0.h,
                                          spreadRadius: 0.1.w,
                                          offset: Offset(-0.2.h, -0.2.h),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 55.w,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                  child: Text(
                                                    vehicle.category ??
                                                        "Category",
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyles
                                                        .regBlack12Bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                  child: Text(
                                                    vehicle.vehicleName ??
                                                        "Vehicle Name",
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyles
                                                        .regBlack10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2.5.h,
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                  child: Text(
                                                    "Starting Price",
                                                    textAlign: TextAlign.center,
                                                    style: AppTextStyles
                                                        .regGreen10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "\$${vehicle.price}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyles
                                                            .regBlack10,
                                                      ),
                                                      Text(
                                                        "/Day",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppTextStyles
                                                            .regGreen10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                            child: SizedBox(
                                          height: 35.w,
                                          width: 35.w,
                                          child:
                                              Image.network(vehicle.url ?? ""),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                )
                              ],
                            );
                          }),
                    )
                  ]),
                ),
              ),
      ),
    );
  }
}
