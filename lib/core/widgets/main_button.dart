import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.onTap,
      this.color,
      this.textColor,
      required this.text,
      this.height,
      this.width});

  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? AppSize.defaultSize! * 4.8,
        width: width ?? AppSize.screenWidth! * .95,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppSize.defaultSize!),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: AppSize.defaultSize! * 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
class SecondButton extends StatelessWidget {
  const SecondButton(
      {super.key,
        this.onTap,
        this.color,
        this.textColor,
        required this.text,
        this.height,
        this.width});

  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? AppSize.defaultSize! * 4,
        width: width ?? AppSize.screenWidth! * .9,
        decoration: BoxDecoration(
          color: color ?? AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(AppSize.defaultSize!),
          border: Border.all(color: AppColors.primaryColor)
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: textColor??AppColors.primaryColor,
            fontSize: AppSize.defaultSize! * 1.5,
          )
        ),
      ),
    );
  }
}
