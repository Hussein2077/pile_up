import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/features/home/presentation/componants/drawer/widgets/drawer-buttons.dart';
import 'package:pile_up/features/home/presentation/componants/drawer/widgets/user_row.dart';
import 'package:pile_up/features/main_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackGroundColor,
      width: AppSize.screenWidth! * .8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.defaultSize! * 3,
          ),
          const UserRowDrawer(),
          const Divider(
            thickness: 1,
          ),
          textButtonRow(onPressed: () {  }, text: StringManager.myWallet.tr(), egp: '3000 EGP'),
          textButtonRow(onPressed: () {  }, text: StringManager.myPiles.tr(), egp: '17'),
          textButtonRow(onPressed: () {  }, text: StringManager.pilesIAm.tr(), egp: '15'),
          const Divider(
            thickness: 1,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: AppSize.defaultSize!*4,),
                  Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                    size: AppSize.defaultSize! * 2,
                  ),
                  SizedBox(
                    width: AppSize.defaultSize!,
                  ),
                  Text(
                    StringManager.logOut.tr(),
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.defaultSize! * 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppSize.screenHeight! * .05,
          ),
        ],
      ),
    );
  }
 Widget textButtonRow({required void Function()? onPressed,
  required String text,
  required String egp,
  }){
    return TextButton(onPressed:onPressed , child: Row(
      children: [
        CustomText(
          text: '$egp    ',
          fontSize: AppSize.defaultSize!*1.6,
          color: AppColors.black,
          fontWeight: FontWeight.w600,

        ),
        CustomText(
          text: text,
          fontSize: AppSize.defaultSize!*1.6,
          color: AppColors.greyColor,
        ),
      ],
    ));
  }
}
