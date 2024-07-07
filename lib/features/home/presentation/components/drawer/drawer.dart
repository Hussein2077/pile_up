import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/service/navigator_services.dart';
import 'package:pile_up/core/service/service_locator.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/utils/methods.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/home/presentation/components/drawer/widgets/user_row.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          textButtonRow(
                  onPressed: ()=> Navigator.pushNamed(context, Routes.myWallet),
                  text: StringManager.myWallet.tr(),
                  egp: '3000 EGP')
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          textButtonRow(
                  onPressed: () {}, text: StringManager.myPiles.tr(), egp: MyProfile.getInstance().myPiles.toString())
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          textButtonRow(
                  onPressed: () {},
                  text: StringManager.pilesIAm.tr(),
                  egp: MyProfile.getInstance().pilesIAmIn.toString())
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.defaultSize! * 1.6,
              vertical: AppSize.defaultSize! * 1,
            ),
            child: InkWell(
              onTap: ()=> Navigator.pushNamed(context, Routes.addressBook),
              child: Text(
                StringManager.addressBook.tr(),
                style: TextStyle(
                  fontSize: AppSize.defaultSize! * 1.7,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSize.defaultSize! * 4,
                ),
                Icon(
                  Icons.headset_mic_outlined,
                  color: AppColors.primaryColor,
                  size: AppSize.defaultSize! * 2,
                ),
                SizedBox(
                  width: AppSize.defaultSize!,
                ),
                Text(
                  StringManager.support.tr(),
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.defaultSize! * 1.6,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.defaultSize!*2.4),
          InkWell(
            onTap: () async {
              await Methods.instance.saveUserToken(authToken: null);
              SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.clear();
              Navigator.of(getIt<NavigationService>()
                  .navigatorKey
                  .currentContext??context)
                  .pushNamedAndRemoveUntil(
                  Routes.login, (Route<dynamic> route) => false);

            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppSize.defaultSize! * 4,
                  ),
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

  Widget textButtonRow({
    required void Function()? onPressed,
    required String text,
    required String egp,
  }) {
    return TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            CustomText(
              text: '$egp    ',
              fontSize: AppSize.defaultSize! * 1.6,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: text,
              fontSize: AppSize.defaultSize! * 1.6,
              color: AppColors.greyColor,
            ),
          ],
        ));
  }
}
