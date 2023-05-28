import 'dart:io';

import 'package:cartech/presentation/screens/signup/signup_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../starting/welcome_page.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key, required this.isUser}) : super(key: key);

  final bool isUser;

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ImagePicker picker = ImagePicker();
  File? image;

  SignupController signupController = Get.put(SignupController());
  pickImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    Utils.printDebug("Path: ${pickedFile!.path}");
    setState(() {
      image = File(pickedFile.path);
      Utils.printDebug("Path in setState: ${pickedFile.path}");
      Utils.printDebug("Path in setState1: ${image!.path}");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController vehicleNameController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController seatsController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    void disposeControllers() {
      emailController.dispose();
      passwordController.dispose();
      firstNameController.dispose();
      lastNameController.dispose();
      phoneController.dispose();
      cityController.dispose();
      addressController.dispose();
      emailController.clear();
      passwordController.clear();
      firstNameController.clear();
      lastNameController.clear();
      phoneController.clear();
      cityController.clear();
      addressController.clear();
    }

    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.kBGWhite,
        body: Form(
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
                        Get.to(() => const WelcomePage());
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
                        "Signup to Cartech",
                        style: AppTextStyles.regBlack15Medium,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                        style: AppTextStyles.regBlackTextField12,
                        maxLines: 1,
                        controller: firstNameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 4.w,
                            color: AppColors.kGrey,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "First Name",
                          hintStyle: AppTextStyles.regBlackTextField12,
                          // errorText: state.errorText,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email"),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                        style: AppTextStyles.regBlackTextField12,
                        maxLines: 1,
                        controller: lastNameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            size: 4.w,
                            color: AppColors.kGrey,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "Last Name",
                          hintStyle: AppTextStyles.regBlackTextField12,
                          // errorText: state.errorText,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email"),
                        ])),
                    SizedBox(
                      height: 2.h,
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
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            size: 4.w,
                            color: AppColors.kGrey,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "Phone Number",
                          hintStyle: AppTextStyles.regBlackTextField12,
                          // errorText: state.errorText,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email"),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                        style: AppTextStyles.regBlackTextField12,
                        maxLines: 1,
                        controller: cityController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            size: 4.w,
                            color: AppColors.kGrey,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "City",
                          hintStyle: AppTextStyles.regBlackTextField12,
                          // errorText: state.errorText,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email"),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                        style: AppTextStyles.regBlackTextField12,
                        maxLines: 1,
                        controller: addressController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_on,
                            size: 4.w,
                            color: AppColors.kGrey,
                          ),
                          border: const OutlineInputBorder(),
                          hintText: "Address",
                          hintStyle: AppTextStyles.regBlackTextField12,
                          // errorText: state.errorText,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          // EmailValidator(errorText: "Enter valid email"),
                        ])),
                    SizedBox(
                      height: 2.h,
                    ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : Container(
                            width: 92.w,
                            height: 6.5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.0.h),
                              border: Border.all(
                                  color: AppColors.kGrey2, width: 0.3.w),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 2.w, bottom: 2.w),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: Text(
                                    "Select Category",
                                    style: AppTextStyles.regBlack10Medium,
                                    textAlign: TextAlign.end,
                                  ),
                                  buttonStyleData: ButtonStyleData(
                                    height: 4.h,
                                    width: 90.w,
                                  ),
                                  items: signupController.vehicleClass
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 50.w,
                                                  child: Text(
                                                    "$item ",
                                                    style: AppTextStyles
                                                        .regBlack10Medium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                  value: signupController.selectedClass.value,
                                  onChanged: (String? value) {
                                    signupController.selectedClass.value =
                                        value!;
                                  },
                                ),
                              ),
                            ),
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            width: 98.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.powerLock.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.powerLock.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "Power Lock",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.powerWindow.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.powerWindow.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "Power Window",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            width: 98.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.powerStearing.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.powerStearing.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "Power Stearing",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.airBags.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.airBags.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "Air Bags",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            width: 98.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.isAC.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.isAC.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "A/C",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Checkbox(
                                    splashRadius: 1.w,
                                    checkColor: AppColors.kBGWhite,
                                    activeColor: AppColors.lightBlue,
                                    value: signupController.isAuto.value,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    onChanged: (value) {
                                      signupController.isAuto.value =
                                          value ?? false;
                                    }),
                                SizedBox(
                                  width: 20.w,
                                  child: Text(
                                    "Automatic",
                                    style: AppTextStyles.regGrey8Bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 4.h,
                            child: Text(
                              "Upload Vehicle Images",
                              style: AppTextStyles.regBlack10Medium,
                            ),
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : image == null
                            ? Center(
                                child: InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: SizedBox(
                                      height: 4.h,
                                      width: 4.h,
                                      child: Icon(
                                        Icons.add_a_photo,
                                        size: 25,
                                        color: AppColors.kAppBGColor,
                                      )),
                                ),
                              )
                            : Center(
                                child: SizedBox(
                                    height: 20.h,
                                    width: 20.h,
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : TextFormField(
                            style: AppTextStyles.regBlackTextField12,
                            maxLines: 1,
                            controller: vehicleNameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.car_repair,
                                size: 4.w,
                                color: AppColors.kGrey,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: "Vehicle Name plus model",
                              hintStyle: AppTextStyles.regBlackTextField12,
                              // errorText: state.errorText,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              // EmailValidator(errorText: "Enter valid email"),
                            ])),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : TextFormField(
                            style: AppTextStyles.regBlackTextField12,
                            maxLines: 1,
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.currency_exchange_rounded,
                                size: 4.w,
                                color: AppColors.kGrey,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: "Price",
                              hintStyle: AppTextStyles.regBlackTextField12,
                              // errorText: state.errorText,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                              // EmailValidator(errorText: "Enter valid email"),
                            ])),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : TextFormField(
                            style: AppTextStyles.regBlackTextField12,
                            maxLines: 1,
                            controller: seatsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.numbers,
                                size: 4.w,
                                color: AppColors.kGrey,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: "No of Seats",
                              hintStyle: AppTextStyles.regBlackTextField12,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "* Required"),
                            ])),
                    widget.isUser
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 2.h,
                          ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                        style: AppTextStyles.regBlackTextField12,
                        maxLines: 1,
                        controller: passwordController,
                        obscureText: !signupController.isVisible.value,
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
                                    child: !signupController.isVisible.value
                                        ? InkWell(
                                            onTap: () {
                                              signupController.isVisible.value =
                                                  true;
                                            },
                                            child: Icon(
                                              Icons.visibility_off,
                                              size: 5.w,
                                            ))
                                        : InkWell(
                                            onTap: () {
                                              signupController.isVisible.value =
                                                  false;
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
                        text: "Signup",
                        height: 6.h,
                        loading: signupController.isLoading.value,
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (formkey.currentState!.validate()) {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              await signupController.signup(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                                "${firstNameController.text.trim()} ${lastNameController.text}",
                                phoneController.text.trim(),
                                addressController.text.trim(),
                                cityController.text.trim(),
                                int.tryParse(seatsController.text.trim()) ?? 4,
                                vehicleNameController.text.trim(),
                                int.tryParse(priceController.text.trim()) ?? 20,
                                widget.isUser,
                                context,
                                image ?? File("path"),
                              );
                            }
                          }
                        }),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
    } else {
      response.exception!.code;
    }
  }
}
