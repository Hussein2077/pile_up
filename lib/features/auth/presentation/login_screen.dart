import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize.defaultSize! * 10,
            ),
            Image.asset(
              AssetPath.logo1,
              height: AppSize.defaultSize! * 7.8,
              width: AppSize.defaultSize! * 10.1,
            ),
            CustomText(
              text: StringManager.welcomeBack.tr(),
              fontSize: AppSize.defaultSize! * 2,
            ),
            CustomText(
              text: StringManager.loginTo.tr(),
              fontSize: AppSize.defaultSize! * 1.2,
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
            Padding(
              padding: EdgeInsets.only(left: AppSize.defaultSize! * 2),
              child: Column(
                children: [
                  ColumnWithTextField(
                    text: StringManager.email.tr(),
                    controller: emailController,
                  ),
                  ColumnWithTextField(
                    text: StringManager.password.tr(),
                    obscureText: isVisible,
                    controller: passwordController,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: CustomText(
                  text: StringManager.forgetYourPassword.tr(),
                  color: AppColors.red,
                  fontSize: AppSize.defaultSize! * 1,
                ),
              ),
            ),
            MainButton(
              text: StringManager.login.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.main);
              },
              width: AppSize.screenWidth! * .9,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Text(
              StringManager.or.tr(),
              style: TextStyle(
                  color: AppColors.greyColor2,
                  fontSize: AppSize.defaultSize! * 1.2,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.google,
                  scale: 2.5,
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(
                  AssetPath.facebook,
                  scale: 2.5,
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(
                  AssetPath.apple,
                  scale: 2.5,
                ),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(
                  AssetPath.google,
                  scale: 2.5,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight! * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringManager.doNotHaveAccount.tr(),
                  style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: AppSize.defaultSize! * 1.4,
                      fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.signUp,
                    );
                  },
                  child: Text(
                    StringManager.signUp.tr(),
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
          ],
        ),
      ),
    );
  }
}
