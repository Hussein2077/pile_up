import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.onTap,
      this.color,
      this.textColor,
      required this.text,
      this.height,
      this.width,
      this.widget});

  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;
  final Widget? widget;

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget != null) widget!,
              if (widget != null)
                SizedBox(
                  height: AppSize.defaultSize! * .8,
                ),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: AppSize.defaultSize! * 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondButton extends StatelessWidget {
  const SecondButton({
    super.key,
    this.onTap,
    this.color,
    this.textColor,
    required this.text,
    this.height,
    this.width,
    required this.showIcon,
    this.iconPath,
    this.iconHeight,
    this.iconWidth,
  });

  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final String text;
  final double? height;
  final double? width;
  final bool showIcon;
  final String? iconPath;
  final double? iconHeight;
  final double? iconWidth;

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
            border: Border.all(color: AppColors.primaryColor)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIcon
                ? Padding(
                  padding: EdgeInsets.only(right: AppSize.defaultSize! /2),
                  child: SvgPicture.asset(
                      iconPath!,
                      height: iconHeight,
                      width: iconWidth,
                    ),
                )
                : Container(),
            // Image.asset(AssetPath.changePassword,scale: 1.2,),
            CustomText(
              text: text,
              color: textColor ?? AppColors.primaryColor,
              fontSize: AppSize.defaultSize! * 1.5,
              fontWeight: FontWeight.w700,
            ),
          ],
        )),
      ),
    );
  }
}
