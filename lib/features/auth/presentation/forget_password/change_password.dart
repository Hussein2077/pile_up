import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  bool isVisible = false;

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context, text: StringManager.resetPassword.tr(), isIcon: true),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2),
        child: Column(
          children: [
            CustomText(
              text: StringManager.weWillSend,
              fontSize: AppSize.defaultSize! * 1.6,
              maxLines: 4,
              textAlign: TextAlign.left,
              color: AppColors.textFadedColor,
              fontWeight: FontWeight.w600,
            ),
            ColumnWithTextField(
              text: StringManager.newPassword.tr(),
              controller: passwordController,
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
            SizedBox(
              height: AppSize.defaultSize! * 4,
            ),
            MainButton(
              text: StringManager.confirm.tr(),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
