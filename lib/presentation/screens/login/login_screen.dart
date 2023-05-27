import 'package:cartech/presentation/screens/login/login_controller.dart';
import 'package:cartech/presentation/screens/starting/welcome_page.dart';
import 'package:cartech/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_images.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../signup/signup_screen.dart';

class LoginView extends StatefulWidget {
  final bool user;
  const LoginView({Key? key, required this.user}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.kBGWhite,
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(child: Utils().loader()),
          child: Form(
            key: formkey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => WelcomePage());
                        },
                        child: SizedBox(
                            height: 4.h,
                            child: Image.asset(
                              AppImages.back,
                              color: AppColors.kAppBGColor,
                            )),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                        child: SizedBox(
                            height: 20.h,
                            child: Image.asset(
                              AppImages.logo,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 7.h,
                        width: 90.w,
                        child: Text(
                          "Signin to Cartech",
                          style: AppTextStyles.regBlack15Medium,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 0.3.h,
                      ),
                      TextFormField(
                          style: AppTextStyles.regBlackTextField12,
                          maxLines: 1,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 4.w,
                              color: AppColors.kGrey,
                            ),
                            border: const OutlineInputBorder(),
                            hintText: "Email",
                            hintStyle: AppTextStyles.regBlackTextField12,
                            // errorText: state.errorText,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email"),
                          ])),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                          style: AppTextStyles.regBlackTextField12,
                          maxLines: 1,
                          controller: passwordController,
                          obscureText: !loginController.isVisible.value,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              size: 4.w,
                              color: AppColors.kGrey,
                            ),
                            suffixIcon: SizedBox(
                                width: 12.w,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 4.w,
                                      // height: 4.w,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                      // height: 4.w,
                                      child: !loginController.isVisible.value
                                          ? InkWell(
                                              onTap: () {
                                                loginController
                                                    .isVisible.value = true;
                                              },
                                              child: Icon(
                                                Icons.visibility_off,
                                                size: 5.w,
                                              ))
                                          : InkWell(
                                              onTap: () {
                                                loginController
                                                    .isVisible.value = false;
                                              },
                                              child: Icon(
                                                Icons.visibility,
                                                size: 5.w,
                                              ),
                                            ),
                                    ),
                                  ],
                                )),
                            hintText: "Password",
                            border: const OutlineInputBorder(),
                            hintStyle: AppTextStyles.regBlackTextField12,
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ])),
                      SizedBox(
                        height: 6.h,
                      ),
                      CustomButton(
                          color: AppColors.kAppBGColor,
                          text: "Login",
                          height: 6.h,
                          loading: loginController.isLoading.value,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (formkey.currentState!.validate()) {
                              if (emailController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                loginController.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                  widget.user,
                                  context,
                                );
                              }
                            }
                          }),
                      SizedBox(
                        height: 3.h,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 3.h,
                            width: 68.w,
                            child: RichText(
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                text: TextSpan(
                                    text: "Have an account ",
                                    style: AppTextStyles.regBlack10Bold,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "Create Account",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.to(() => SignupView(
                                                    isUser: widget.user,
                                                  ));
                                            }),
                                    ])),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
