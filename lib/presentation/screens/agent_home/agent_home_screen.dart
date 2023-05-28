import 'package:cartech/presentation/widgets/custom_button.dart';
import 'package:cartech/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_utils.dart';
import 'agent_home_controller.dart';

class AgentHomeScreen extends StatefulWidget {
  const AgentHomeScreen({Key? key}) : super(key: key);

  @override
  State<AgentHomeScreen> createState() => _AgentHomeScreenState();
}

class _AgentHomeScreenState extends State<AgentHomeScreen> {
  AgentHomeController agentHomeController = Get.put(AgentHomeController());
  @override
  void initState() {
    agentHomeController.getInitialValue();
    agentHomeController.getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: agentHomeController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(AppColors.kAppBGColor),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 4.h,
                        child: Text(
                          "My Vehicle",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.regBlack15Bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 25.h,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1.0.h),
                              topRight: Radius.circular(1.0.h)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.04),
                              blurRadius: 0.5.h,
                              spreadRadius: 0.2.h,
                              offset: Offset(0.5.h, 0.5.h),
                            ),
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.04),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      child: Text(
                                        agentHomeController
                                                .vehicle.value.category ??
                                            "Category",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regBlack12Bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                      child: Text(
                                        agentHomeController
                                                .vehicle.value.vehicleName ??
                                            "Vehicle Name",
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regBlack10,
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
                                        style: AppTextStyles.regGreen10,
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
                                            "\$${agentHomeController.vehicle.value.price}",
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.regBlack10,
                                          ),
                                          Text(
                                            "/Day",
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles.regGreen10,
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
                              child: Image.network(
                                  agentHomeController.vehicle.value.url ?? ""),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(1.0.h),
                              topRight: Radius.circular(1.0.h)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.04),
                              blurRadius: 0.5.h,
                              spreadRadius: 0.2.h,
                              offset: Offset(0.5.h, 0.5.h),
                            ),
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.04),
                              blurRadius: 1.0.h,
                              spreadRadius: 0.1.w,
                              offset: Offset(-0.2.h, -0.2.h),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              height: 4.h,
                              child: Text(
                                "Vehicle Informaion",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regBlack12Medium,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50.w,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "Seats: ${agentHomeController.vehicle.value.seats}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "Power Window: ${agentHomeController.vehicle.value.powerWindow ?? false ? "Yes" : "No"}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "Stearing: ${agentHomeController.vehicle.value.powerStearing ?? false ? "Power" : "Without Power"}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  width: 45.w,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "Power Lock: ${agentHomeController.vehicle.value.powerLock ?? false ? "Yes" : "No"}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "AC: ${agentHomeController.vehicle.value.ac ?? false ? "Yes" : "No"}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                          child: Text(
                                            "Trans: ${agentHomeController.vehicle.value.automatic ?? false ? "Yes" : "No"}",
                                            textAlign: TextAlign.center,
                                            style:
                                                AppTextStyles.regBlack10Medium,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomButton(
                        height: 6.h,
                        width: 90.w,
                        text: "Logout",
                        color: AppColors.kAppBGColor,
                        onPressed: () {
                          Utils.signOut(context);
                        },
                      )
                    ],
                  ),
                )),
        ));
  }
}
