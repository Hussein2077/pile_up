import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/componants/Piles%20Details/piles_details.dart';
import 'package:pile_up/features/main_screen.dart';
import 'package:pile_up/features/my_piles/presentation/widgets/folder.dart';
import 'package:pile_up/main.dart';

class PileIAmIn extends StatefulWidget {
  const PileIAmIn({super.key});

  @override
  State<PileIAmIn> createState() => _PileIAmInState();
}

class _PileIAmInState extends State<PileIAmIn> {
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();

  Widget image() {
    return FloatActionButtonText(
      onPressed: (){

        fabKey.currentState?.animate();
      },
      icon: const Icon(Icons.folder_open,color: AppColors.green,),
      textLeft: -150,
      text: StringManager.createFolder.tr(),
    );
  }

  Widget inbox() {
    return FloatActionButtonText(
      onPressed: (){
        MainScreen.mainIndex=2;
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const MainScreen(),
          withNavBar: false,
          pageTransitionAnimation:
          PageTransitionAnimation.fade,
        );
        // Navigator.pushNamed(context, Routes.main);
        fabKey.currentState?.animate();
      },
      icon:const Icon(Icons.add_card_outlined,color: AppColors.green,) ,
      textLeft: -135,
      text: StringManager.createPile.tr(),
    );
  }
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
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
              FolderWidget(
              text: 'On Going Piles',
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PilesDetails(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.fade,
                );
              },
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
              FolderWidget(
              text: 'History',
              onTap: (){
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: const PilesDetails(),
                  withNavBar: false,
                  pageTransitionAnimation:
                  PageTransitionAnimation.fade,
                );
              },
            ),

            SizedBox(
              height: AppSize.defaultSize! * 6,
            ),
          ],
        ),
      ),
    );
  }
}
