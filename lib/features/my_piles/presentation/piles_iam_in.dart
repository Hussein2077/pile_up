import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/home/presentation/componants/Piles%20Details/piles_details.dart';
import 'package:pile_up/features/my_piles/presentation/widgets/folder.dart';

class PileIAmIn extends StatefulWidget {
  const PileIAmIn({super.key});

  @override
  State<PileIAmIn> createState() => _PileIAmInState();
}

class _PileIAmInState extends State<PileIAmIn> {
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, bottom: false,leading: false,widget: CustomText(
        text: StringManager.pilesIAm.tr(),
        color: Colors.white,
        fontSize: AppSize.defaultSize!*2.4,
        fontWeight: FontWeight.w700,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: StringManager.searchFor.tr(),
              height: AppSize.defaultSize! * 5,
              width: AppSize.screenWidth!,
              hintStyle: TextStyle(
                color: AppColors.greyColor.withOpacity(.5),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.greyColor.withOpacity(.5),
                size: AppSize.defaultSize!* 3.5,
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
              FolderWidget(
              text: 'On Going Piles',
              showEditIcon: false,
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PilesDetails(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.fade,
                );
              },
            ).animate().fade().scale(),
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
              FolderWidget(
              text: 'History',
              showEditIcon: false,
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PilesDetails(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.fade,
                );
              },
            ).animate().fade().scale(),

            SizedBox(
              height: AppSize.defaultSize! * 6,
            ),
          ],
        ),
      ),
    );
  }
}
