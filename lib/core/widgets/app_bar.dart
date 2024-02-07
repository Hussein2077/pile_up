import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';

AppBar appBar(BuildContext context, {required String text,void Function()? actionsOnPressed}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 1,
    title: CustomText(
      text: text,
      fontSize: AppSize.defaultSize!*2.2,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    actions: [
      Padding(
        padding:   EdgeInsets.only(right:AppSize.defaultSize!*1.5 ),
        child: IconButton(
          onPressed: actionsOnPressed,
          icon:Image.asset(AssetPath.notification,
            width: AppSize.defaultSize!*1.8,
            height: AppSize.defaultSize!*2.3,
          ),
        ),
      )
    ],
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
      
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
