import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/social_media_login.dart';

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 5,
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
              Padding(
                padding: EdgeInsets.only(
                    top: AppSize.defaultSize! * 1.6,
                    bottom: AppSize.defaultSize! * 3.2),
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
                onTap: () {
                  Navigator.pushNamed(context, Routes.main);
                },
                // width: AppSize.screenWidth! * .9,
              ),
              SizedBox(
                height: AppSize.defaultSize! * 16,
              ),
              const SocialMediaLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
