import 'package:cartech/presentation/screens/login/login_screen.dart';
import 'package:cartech/presentation/screens/signup/signup_screen.dart';
import 'package:cartech/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/text_styles.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool user = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            user
                ? InkWell(
                    onTap: () {
                      setState(() {
                        user = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 4.h,
                          width: 60.w,
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: DefaultTextStyle(
                              style: AppTextStyles.regGreen12,
                              textAlign: TextAlign.end,
                              child: const Text("Are you car Hire Agency"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        user = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 4.h,
                          width: 40.w,
                          child: Padding(
                            padding: EdgeInsets.only(right: 4.w),
                            child: DefaultTextStyle(
                              style: AppTextStyles.regGreen12,
                              textAlign: TextAlign.end,
                              child: const Text("Are you Buyer"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.h,
                  // width: 22.w,
                  child: DefaultTextStyle(
                    style: AppTextStyles.regGreen15Medium,
                    textAlign: TextAlign.start,
                    child: const Text("Welcome to CarTech"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
                width: 80.w,
                height: 35.h,
                child: Image.asset(
                  AppImages.car,
                  // fit: BoxFit.fill,
                )),
            SizedBox(
              height: 12.h,
            ),
            CustomButton(
              onPressed: () {
                Get.to(() => LoginView(
                      user: user,
                    ));
              },
              text: "Login",
              color: AppColors.kAppBGColor,
              height: 5.4.h,
              width: 90.w,
            ),
            SizedBox(
              height: 4.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => SignupView(
                      isUser: user,
                    ));
              },
              child: Container(
                  height: 5.4.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      color: AppColors.kBGWhite,
                      borderRadius: BorderRadius.circular(3.0.h),
                      border: Border.all(color: AppColors.kGrey, width: 0.5.w)),
                  child: Center(
                    child: Text(
                      "Signup",
                      style: AppTextStyles.regGreen10Bold,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
