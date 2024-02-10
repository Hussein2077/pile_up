import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/notification_row.dart';
import 'package:pile_up/features/main_screen.dart';

AppBar appBar(BuildContext context,
    {required String text, void Function()? actionsOnPressed}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 1,
    title: CustomText(
      text: text,
      fontSize: AppSize.defaultSize! * 2.2,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: AppSize.defaultSize! * 1.5),
        child: IconButton(
          onPressed: actionsOnPressed ??
              () {
                showNotification(context);
              },
          icon: Image.asset(
            AssetPath.notification,
            width: AppSize.defaultSize! * 1.8,
            height: AppSize.defaultSize! * 2.3,
          ),
        ),
      )
    ],
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
  );
}AppBar authAppBar(BuildContext context,
    {required String text, void Function()? actionsOnPressed}) {
  return AppBar(
    backgroundColor: AppColors.scaffoldBackground,
    elevation: 0,
    title: CustomText(
      text: text,
      fontSize: AppSize.defaultSize! * 2.2,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),

    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.primaryColor,
      ),
    ),
  );
}

AppBar homeAppBar(BuildContext context,
    {String? text,
    void Function()? actionsOnPressed,
    void Function()? leadingOnPressed,
    Widget? widget,
    bool leading = true,
    bool bottom = false}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 1,
    bottom: bottom
        ? PreferredSize(
            preferredSize: Size(AppSize.screenWidth!, AppSize.defaultSize! * 5),
            child: Container(
              width: AppSize.screenWidth!,
              height: AppSize.defaultSize! * 5,
              color: Colors.white,
              child: CustomTextField(
                hintText: StringManager.searchFor.tr(),
                hintStyle:
                    TextStyle(color: AppColors.greyColor.withOpacity(.5)),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.greyColor.withOpacity(.5),
                ),
              ),
            ),
          )
        : const PreferredSize(preferredSize: Size(0, 0), child: SizedBox()),
    title: widget ??
        Image.asset(
          AssetPath.logo,
          width: AppSize.defaultSize! * 4.2,
          height: AppSize.defaultSize! * 3.2,
        ),
    centerTitle: true,
    leading: leading
        ? IconButton(
            onPressed: leadingOnPressed,
            icon: Image.asset(
              AssetPath.menu,
              width: AppSize.defaultSize! * 2,
              height: AppSize.defaultSize! * 2,
            ),
          )
        : const SizedBox(),
    actions: [
      IconButton(
        onPressed: actionsOnPressed ??
            () {
              showNotification(context);
            },
        icon: Image.asset(
          AssetPath.notification,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      )
    ],
  );
}

showNotification(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: AppSize.defaultSize! * 1.5,
          ),
          child: Dialog(
            alignment: Alignment.topRight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
            ),
            child: Container(
              height: AppSize.screenHeight! * .45,
              // width: AppSize.screenWidth! * .95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
              ),
              child: const NotificationRow(),
            ),
          ),
        );
      });
}
