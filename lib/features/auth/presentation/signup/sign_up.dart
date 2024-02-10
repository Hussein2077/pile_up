import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late TextEditingController universityController;
  late TextEditingController majorController;
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
    universityController = TextEditingController();
    majorController = TextEditingController();
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
    universityController.dispose();
    majorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ),
                  const Spacer(),
                  ColumnWithTextField(
                    text: StringManager.secondName.tr(),
                    controller: lastNameController,
                    width: AppSize.screenWidth! * .4,
                  ),
                ],
              ),
              ColumnWithTextField(
                text: StringManager.phoneNum.tr(),
                controller: phoneController,
              ),
              ColumnWithTextField(
                text: StringManager.email.tr(),
                controller: emailController,
              ),
              ColumnWithTextField(
                text: StringManager.password.tr(),
                controller: passwordController,
              ),
              ColumnWithTextField(
                text: StringManager.confirmPassword.tr(),
                controller: passwordConfirmController,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              MainButton(
                text: StringManager.signUp.tr(),
                onTap: () {
                  if (validation()) {
                    BlocProvider.of<SignUpWithEmailAndPasswordBloc>(context)
                        .add(SignUpWithEmailAndPasswordEvent(
                      phone: phoneController.text,
                      password: passwordController.text,
                      major: majorController.text,
                      university: universityController.text,
                      name:
                          '${firstNameController.text} ${lastNameController.text}',
                      email: emailController.text,
                    ));
                  } else {
                    errorSnackBar(
                        context, StringManager.pleaseCompleteYourData.tr());
                  }
                },
              ),
              SizedBox(
                height: AppSize.defaultSize! * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.youAlready.tr(),
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: AppSize.defaultSize! * 1.4,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: Text(
                      StringManager.signIn.tr(),
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppSize.defaultSize! * 1.5,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
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
    } else if (universityController.text == '') {
      return false;
    } else if (majorController.text == '') {
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
