import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';

AppBar appBar(BuildContext context, {required String text}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: Text(
      text,
      style: TextStyle(fontSize: AppSize.defaultSize! * 1.5),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
  );
}

AppBar homeAppBar(BuildContext context,
    {String? text, void Function()? actionsOnPressed, Widget? widget}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 1,
    title: widget ??
        Image.asset(
          AssetPath.logo,
          width: AppSize.defaultSize! * 4.2,
          height: AppSize.defaultSize! * 3.2,
        ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: Image.asset(
        AssetPath.menu,
        width: AppSize.defaultSize! * 2,
        height: AppSize.defaultSize! * 2,
      ),
    ),
    actions: [
      IconButton(
        onPressed: actionsOnPressed,
        icon: Image.asset(
          AssetPath.notification,
          width: AppSize.defaultSize! * 2.5,
          height: AppSize.defaultSize! * 2.5,
        ),
      )
    ],
  );
}
