
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/auth/presentation/forget_password/widgets/pin_text_field.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context,
          text: StringManager.verifyOTP.tr(), isIcon: false),
      body: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize! * 2.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringManager.codeSendToMobNum.tr(),
              maxLines: 4,
              style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.6,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.textFadedColor
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 2.4),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: AppSize.screenWidth! * .6,
                  child: const CustomPinCodeTextField()),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Text(
                  StringManager.resendCode.tr(),
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: AppSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 1,
                      color: AppColors.primaryColor,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            SizedBox(height: AppSize.defaultSize! * 3.2),
            MainButton(
              text: StringManager.verify.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.main);
              },
            ),
          ],
        ),
      ),
    );
  }
}
