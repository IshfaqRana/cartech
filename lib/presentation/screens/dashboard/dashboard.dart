import 'package:cartech/presentation/screens/user_home/user_home_screen.dart';
import 'package:cartech/utils/app_colors.dart';
import 'package:cartech/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/text_styles.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          textAlign: TextAlign.center,
          style: AppTextStyles.regBlack12Bold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: InkWell(
                onTap: () {
                  Utils.signOut(context);
                },
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: AppColors.kBGWhite,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
                height: 5.h,
                child: TextFormField(
                  style: AppTextStyles.regBlackTextField12,
                  maxLines: 1,
                  controller: search,
                  decoration: InputDecoration(
                    suffixIcon: SizedBox(
                        width: 12.w,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: AppColors.kAppBGColor,
                                    borderRadius: BorderRadius.circular(2.w)),
                                width: 8.w,
                                height: 8.w,
                                child: Icon(
                                  Icons.search,
                                  size: 25,
                                  color: AppColors.kBGWhite,
                                )),
                          ],
                        )),
                    hintText: "Search",
                    border: const OutlineInputBorder(),
                    hintStyle: AppTextStyles.regBlackTextField12,
                  ),
                )),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 20.h,
              width: 94.w,
              child: Image.asset(
                AppImages.user,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 5.h,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.kAppBGColor,
                    borderRadius: BorderRadius.circular(2.w)),
                width: 40.w,
                child: Center(
                  child: Text(
                    "Vehicle Available",
                    style: AppTextStyles.regWhite10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => UserHomeScreen(
                            type: "cars",
                          ));
                    },
                    child: SizedBox(
                      width: 44.w,
                      height: 32.w,
                      child: Image.asset(
                        AppImages.car_1,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => UserHomeScreen(
                            type: "pickup",
                          ));
                    },
                    child: SizedBox(
                      width: 44.w,
                      height: 32.w,
                      child: Image.asset(
                        AppImages.car_2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => UserHomeScreen(
                            type: "van",
                          ));
                    },
                    child: SizedBox(
                      width: 44.w,
                      height: 32.w,
                      child: Image.asset(
                        AppImages.car_3,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => UserHomeScreen(
                            type: "suv",
                          ));
                    },
                    child: SizedBox(
                      width: 44.w,
                      height: 32.w,
                      child: Image.asset(
                        AppImages.car_4,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ]),
        ),
      ),
    );
  }
}
