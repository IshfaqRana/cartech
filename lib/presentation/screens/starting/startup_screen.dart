import 'package:cartech/presentation/screens/starting/welcome_page.dart';
import 'package:cartech/presentation/widgets/custom_button.dart';
import 'package:cartech/utils/app_colors.dart';
import 'package:cartech/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_images.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const WelcomePage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 4.h,
                    width: 22.w,
                    child: DefaultTextStyle(
                      style: AppTextStyles.regGreen12,
                      textAlign: TextAlign.start,
                      child: const Text("skip"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              height: 50.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3, // Number of pages
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return _currentPage == 0
                      ? Container(
                          color: AppColors
                              .kBGWhite, // Replace with your page content
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 80.w,
                                    height: 35.h,
                                    child: Image.asset(
                                      AppImages.location,
                                      fit: BoxFit.fill,
                                    )),
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
                                        child: const Text(
                                            "Request a Car from any location"),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : _currentPage == 1
                          ? Container(
                              color: AppColors
                                  .kBGWhite, // Replace with your page content
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 80.w,
                                        height: 35.h,
                                        child: Image.asset(
                                          AppImages.calendar,
                                          // fit: BoxFit.fill,
                                        )),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                          // width: 22.w,
                                          child: DefaultTextStyle(
                                            style:
                                                AppTextStyles.regGreen15Medium,
                                            textAlign: TextAlign.start,
                                            child: const Text("Select a Date"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              color: AppColors
                                  .kBGWhite, // Replace with your page content
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 80.w,
                                        height: 35.h,
                                        child: Image.asset(
                                          AppImages.pickcar,
                                          // fit: BoxFit.fill,
                                        )),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                          // width: 22.w,
                                          child: DefaultTextStyle(
                                            style:
                                                AppTextStyles.regGreen15Medium,
                                            textAlign: TextAlign.start,
                                            child: const Text(
                                                "Pick a Perfect Car for your trip"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                },
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDot(0),
                buildDot(1),
                buildDot(2),
              ],
            ),
            SizedBox(height: 10.h),
            CustomButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.animateToPage(_currentPage + 1,
                      duration: const Duration(microseconds: 100),
                      curve: Curves.bounceIn);

                  setState(() {
                    _currentPage = _currentPage + 1;
                  });
                } else {
                  Get.to(() => const WelcomePage());
                }
              },
              text: _currentPage < 2 ? "Next" : "Get Started",
              color: AppColors.kAppBGColor,
              height: 5.4.h,
              width: 90.w,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: _currentPage == index ? 8.w : 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.kAppBGColor : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
