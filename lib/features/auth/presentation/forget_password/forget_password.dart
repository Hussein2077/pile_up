import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/social_media_login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,
          text: StringManager.resetPassword.tr(), isIcon: false),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.weWillSend.tr(),
              maxLines: 4,
              style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.6,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textColorUnselected),
            ),
            ColumnWithTextField(
              text: StringManager.enterYourEmail.tr(),
              fontSize: AppSize.defaultSize!*1.6,
              controller: emailController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: AppSize.defaultSize! * 2.5),
            Text(
              'With Login or Register, you accept of the ',
              style: TextStyle(
                color: AppColors.textColorUnselected,
                fontSize: AppSize.defaultSize! * 1.6,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.terms),
                  child: Text(
                    'term of use ',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      color: AppColors.primaryColor,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                  ),
                ),
                Text(
                  'and our ',
                  style: TextStyle(
                    color: AppColors.textColorUnselected,
                    fontSize: AppSize.defaultSize! * 1.6,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.terms),
                  child: Text(
                    'privacy policy.',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      color: AppColors.primaryColor,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.defaultSize! * 3.5),
            MainButton(
              text: StringManager.sendCode.tr(),
              fontSize: AppSize.defaultSize!*1.8,
              fontWeight: FontWeight.w600,
              onTap: () {
                Navigator.pushNamed(context, Routes.sendOTPCode);
              },
            ),
            // const Spacer(),
            // const SocialMediaLogin(),
          ],
        ),
      ),
    );
  }
}

