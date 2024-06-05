import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/core/widgets/social_media_login.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocListener<LoginWithEmailAndPasswordBloc,
            LoginWithEmailAndPasswordState>(
          listener: (context, state) {
            if (state is LoginWithEmailAndPasswordSuccessMessageState) {
              EasyLoading.dismiss();
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.home, (route) => false);
            } else if (state is LoginWithEmailAndPasswordErrorMessageState) {
              EasyLoading.dismiss();
              EasyLoading.showError(state.errorMessage);
            } else if (state is LoginWithEmailAndPasswordLoadingState) {
              EasyLoading.show(status: 'loading...');
            } else {
              EasyLoading.dismiss();
            }
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.defaultSize! * 7.4,
                ),
                Image.asset(
                  AssetPath.logo1,
                  height: AppSize.defaultSize! * 7.8,
                  width: AppSize.defaultSize! * 10.1,
                ),
                CustomText(
                  text: StringManager.welcomeBack.tr(),
                  fontSize: AppSize.defaultSize! * 2,
                  fontWeight: FontWeight.w700,
                  color: AppColors.welcomeTextVerifyMob,
                ),
                CustomText(
                  text: StringManager.loginTo.tr(),
                  fontSize: AppSize.defaultSize! * 1.4,
                  color: AppColors.greyColor,
                ),
                // TextButton(
                //     onPressed: () {
                //       if (context.locale == const Locale('en')) {
                //         context.setLocale(const Locale('ar'));
                //       } else {
                //         context.setLocale(const Locale('en'));
                //       }
                //       setState(() {});
                //     },
                //     child: Text(
                //       context.locale == const Locale('en')
                //           ? 'عربي'
                //           : 'English',
                //       style: TextStyle(
                //           fontSize: AppSize.defaultSize! * 1.2,
                //           fontWeight: FontWeight.w600),
                //     )),
                ColumnWithTextField(
                  text: StringManager.email.tr(),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  fontSize: AppSize.defaultSize! * 1.6,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2.5,
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
                //Forget Password
                Padding(
                  padding: EdgeInsets.only(
                      top: AppSize.defaultSize! * 1,
                      bottom: AppSize.defaultSize! * 3,
                      right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.forgetPassword),
                      child: Text(
                        StringManager.forgetYourPassword.tr(),
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primaryColor,
                            fontSize: AppSize.defaultSize! * 1.6),
                      ),
                    ),
                  ),
                ),
                MainButton(
                  text: StringManager.loginCap.tr(),
                  fontSize: AppSize.defaultSize! * 1.8,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                     errorSnackBar(context, StringManager.pleaseEnterPasswordAndEmail.tr());
                    } else {
                      BlocProvider.of<LoginWithEmailAndPasswordBloc>(context)
                          .add(LoginWithEmailAndPasswordEvent(
                              email: emailController.text,
                              password: passwordController.text));
                    }
                  },
                  // width: AppSize.screenWidth! * .9,
                ),
                SizedBox(height: AppSize.defaultSize! * 1.6),
                //Social Media Sign In
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    StringManager.or.tr(),
                    style: TextStyle(
                        color: AppColors.greyColor2,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: AppSize.defaultSize! * 1.6,
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.defaultSize! * 70,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetPath.google,
                            scale: 3,
                          ),
                          SizedBox(
                            width: AppSize.defaultSize! * 4,
                          ),
                          Image.asset(
                            AssetPath.facebook,
                            scale: 3,
                          ),
                          SizedBox(
                            width: AppSize.defaultSize! * 4,
                          ),
                          Image.asset(
                            AssetPath.apple,
                            scale: 3,
                          ),
                          SizedBox(
                            width: AppSize.defaultSize! * 4,
                          ),
                          Image.asset(
                            AssetPath.google,
                            scale: 3,
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.defaultSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringManager.doNotHaveAccount.tr(),
                            style: TextStyle(
                              // color: AppColors.black,
                              fontSize: AppSize.defaultSize! * 1.6,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.signUp);
                            },
                            child: Text(
                              StringManager.signUp.tr(),
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
                    ],
                  ),
                ),
                SizedBox(height: AppSize.defaultSize!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
