import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  DateTime selectedDate = DateTime.now();
  String selectedValue = 'Option 1';

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  bool isVisible = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpWithEmailAndPasswordBloc,
        SignUpWithEmailAndPasswordState>(
      listener: (context, state) {
        if (state is SignUpWithEmailAndPasswordSuccessMessageState) {
          EasyLoading.dismiss();

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.main,
            (route) => false,
          );
        } else if (state is SignUpWithEmailAndPasswordErrorMessageState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage);
        } else if (state is SignUpWithEmailAndPasswordLoadingState) {
          EasyLoading.show(status: 'loading...');
        }
      },
      child: Scaffold(
        appBar: authAppBar(context, text: StringManager.signUp.tr()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ColumnWithTextField(
                      text: StringManager.firstName.tr(),
                      controller: firstNameController,
                      width: AppSize.screenWidth! * .4,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                    const Spacer(),
                    ColumnWithTextField(
                      text: StringManager.secondName.tr(),
                      controller: lastNameController,
                      width: AppSize.screenWidth! * .4,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                  ],
                ),
                ColumnWithTextField(
                  text: StringManager.mobileNum.tr(),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  fontSize: AppSize.defaultSize! * 1.6,
                ),
                ColumnWithTextField(
                  text: StringManager.email.tr(),
                  controller: emailController,
                  fontSize: AppSize.defaultSize! * 1.6,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  ),
                ),
                ColumnWithTextField(
                  text: StringManager.password.tr(),
                  controller: passwordController,
                  fontSize: AppSize.defaultSize! * 1.6,
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: AppSize.defaultSize! * 1.8,
                    ),
                  ),
                ),
                ColumnWithTextField(
                  text: StringManager.confirmPassword.tr(),
                  controller: passwordConfirmController,
                  fontSize: AppSize.defaultSize! * 1.6,
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: AppSize.defaultSize! * 1.8,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.defaultSize! * 1.5),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      icon: Icon(
                        selected
                            ? Icons.check_circle
                            : Icons.check_circle_outline,
                        color: AppColors.primaryColor,
                        size: AppSize.defaultSize! * 2.5,
                      ),
                    ),
                    Text(
                      'I agree to ',
                      style: TextStyle(
                        color: AppColors.borderColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, Routes.terms),
                      child: Text(
                        'Privacy Policy ',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                      ),
                    ),
                    Text(
                      'and ',
                      style: TextStyle(
                        color: AppColors.borderColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, Routes.terms),
                      child: Text(
                        'Terms of Use.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.defaultSize! * 1.5),
                MainButton(
                  text: StringManager.signUpCap.tr(),
                  fontSize: AppSize.defaultSize! * 1.8,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    if (validation()) {
                      BlocProvider.of<SignUpWithEmailAndPasswordBloc>(context)
                          .add(SignUpWithEmailAndPasswordEvent(
                        phone: phoneController.text,
                        password: passwordController.text,
                        name: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                      ));
                    } else {
                      errorSnackBar(
                          context, StringManager.pleaseCompleteYourData.tr());
                    }
                  },
                ),
                SizedBox(height: AppSize.defaultSize! * 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.youAlready.tr(),
                      style: TextStyle(
                        // color: AppColors.greyColor,
                        fontSize: AppSize.defaultSize! * 1.6,
                        // fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.login);
                      },
                      child: Text(
                        StringManager.login.tr(),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.defaultSize! * 5.5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget dropDownSignUp({required String text, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: AppSize.defaultSize! * 1.4,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: AppSize.defaultSize! * .3,
        ),
        Container(
          width: AppSize.screenWidth! * .4,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * .5)),
          child: Center(
            child: DropdownButton<String>(
              value: selectedValue,
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              hint: Text(
                hintText,
                style: TextStyle(
                  fontSize: AppSize.defaultSize!,
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(left: AppSize.defaultSize! * 3),
                child: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: AppSize.defaultSize! * 3,
                ),
              ),
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: AppSize.defaultSize!,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  bool validation() {
    if (emailController.text == '') {
      return false;
    } else if (firstNameController.text == '') {
      return false;
    } else if (lastNameController.text == '') {
      return false;
    } else if (phoneController.text == '') {
      return false;
    } else if (passwordController.text == '') {
      return false;
    } else if (passwordConfirmController.text == '') {
      return false;
    } else if (selectedValue == '') {
      return false;
    } else {
      return true;
    }
  }
}
