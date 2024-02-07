import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';

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
          children: [
            SizedBox(
              height: AppSize.screenHeight! * .3,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(AssetPath.loginBackground)),
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetPath.logo,
                            scale: 2,
                          ),
                          Text(
                            StringManager.welcomeBack.tr(),
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: AppSize.defaultSize! * 1.8,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            StringManager.youHaveBeenMissed.tr(),
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: AppSize.defaultSize! * 1.2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            if (context.locale == const Locale('en')) {
                              context.setLocale(const Locale('ar'));
                            } else {
                              context.setLocale(const Locale('en'));
                            }
                            setState(() {});
                          },
                          child: Text(
                            context.locale == const Locale('en')
                                ? 'عربي'
                                : 'English',
                            style: TextStyle(
                                fontSize: AppSize.defaultSize! * 1.2,
                                fontWeight: FontWeight.w600),
                          )))
                ],
              ),
            ),
            CustomTextField(
              labelText: StringManager.email.tr(),
              controller: emailController,
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            CustomTextField(
              labelText: StringManager.password.tr(),
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Text(
                  StringManager.forgetYourPassword.tr(),
                  style: TextStyle(
                    color: AppColors.forgetPasswordColor,
                    fontSize: AppSize.defaultSize! * 1,
                  ),
                ),
              ),
            ),
            MainButton(
              text: StringManager.login.tr(),
              onTap: () {

                Navigator.pushNamed(context, Routes.main);
              },
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Text(
              StringManager.or.tr(),
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: AppSize.defaultSize! * 1.2,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetPath.google),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(AssetPath.facebook),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(AssetPath.apple),
                SizedBox(
                  width: AppSize.defaultSize! * 2,
                ),
                Image.asset(AssetPath.google),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight! * .1,
            ),
            Container(
              color: AppColors.containerColor,
              height: AppSize.defaultSize! * 4.8,
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
