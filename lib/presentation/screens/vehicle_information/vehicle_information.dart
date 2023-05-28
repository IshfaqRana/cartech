import 'package:cartech/data/models/vehicle_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../chat_page/chat_page_for_users.dart';

class VehicleInformation extends StatefulWidget {
  VehicleDataModel vehicle;
  VehicleInformation({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Information",
          textAlign: TextAlign.center,
          style: AppTextStyles.regBlack12Bold,
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: SizedBox(
              height: 4.h,
              child: Image.asset(
                AppImages.back,
                color: AppColors.kBGWhite,
              )),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                              widget.vehicle.category ?? "Category",
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
                              widget.vehicle.vehicleName ?? "Vehicle Name",
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
                                  "\$${widget.vehicle.price}",
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
                    child: Image.network(widget.vehicle.url ?? ""),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "Seats: ${widget.vehicle.seats}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "Power Window: ${widget.vehicle.powerWindow ?? false ? "Yes" : "No"}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "Stearing: ${widget.vehicle.powerStearing ?? false ? "Power" : "Without Power"}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        width: 45.w,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "Power Lock: ${widget.vehicle.powerLock ?? false ? "Yes" : "No"}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "AC: ${widget.vehicle.ac ?? false ? "Yes" : "No"}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                                child: Text(
                                  "Trans: ${widget.vehicle.automatic ?? false ? "Yes" : "No"}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regBlack10Medium,
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
              text: "Chat with Car Owner",
              color: AppColors.kAppBGColor,
              onPressed: () {
                Get.to(() => ChatScreenForUser(
                      user_id: widget.vehicle.uid ?? "",
                      timestamp: 0,
                    ));
              },
            )
          ],
        ),
      )),
    );
  }
}
