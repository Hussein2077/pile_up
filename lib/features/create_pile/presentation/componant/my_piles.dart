import 'dart:developer';

import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/my_pile_details.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_state.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/folder.dart';


class MyPiles extends StatefulWidget {
  const MyPiles({super.key});

  @override
  State<MyPiles> createState() => _MyPilesState();
}

class _MyPilesState extends State<MyPiles> {
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: homeAppBar(context,
          bottom: false,
          leading: false,
          widget: CustomText(
            text: StringManager.myPiles.tr(),
            color: Colors.white,
            fontSize: AppSize.defaultSize! * 2.4,
            fontWeight: FontWeight.w700,
          )),
      body: BlocBuilder<GetFoldersBloc, GetFoldersState>(
        builder: (context, state) {
          if (state is GetFoldersSuccessMessageState) {
            log('${state.folderModel.length} sssxssxs');
            return SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: StringManager.searchFor.tr(),
                    fillColor: AppColors.white,
                    isFilled: true,
                    height: AppSize.defaultSize! * 5,
                    width: AppSize.screenWidth!,
                    hintStyle: TextStyle(
                      color: AppColors.greyColor.withOpacity(.5),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.greyColor.withOpacity(.5),
                      size: AppSize.defaultSize! * 3,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.defaultSize! * 1.6,
                  ),
                  ListView.builder(
                    itemCount: state.folderModel.length,
                    padding:   EdgeInsets.only(bottom: AppSize.defaultSize! * 3),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap:   true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding:   EdgeInsets.all( AppSize.defaultSize!*.5),
                        child: FolderWidget(
                        folderModel: state.folderModel[i],
                          showEditIcon: true,

                        ).animate().fade().scale(),
                      );
                    },
                  ),


                ],
              ),
            );
          } else if (state is GetFoldersLoadingState) {
            return const LoadingWidget();
          } else if (state is GetFoldersErrorMessageState) {
            return ErrorWidget(state.errorMessage);
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}
// floatingActionButton: Padding(
//   padding: EdgeInsets.only(bottom: AppSize.defaultSize! * 3),
//   child: AnimatedFloatingActionButton(
//     key: fabKey,
//     fabButtons: <Widget>[
//       image(),
//       inbox(),
//     ],
//     colorStartAnimation: AppColors.green,
//     colorEndAnimation: Colors.red,
//   ),
// ),

// Widget image() {
//   return FloatActionButtonText(
//     onPressed: () {
//       fabKey.currentState?.animate();
//     },
//     icon: const Icon(
//       Icons.folder_open,
//       color: AppColors.green,
//     ),
//     textLeft: -150,
//     text: StringManager.createFolder.tr(),
//   );
// }

// Widget inbox() {
//   return FloatActionButtonText(
//     onPressed: () {
//       MainScreen.mainIndex = 2;
//       PersistentNavBarNavigator.pushNewScreen(
//         context,
//         screen: const MainScreen(),
//         withNavBar: false,
//         pageTransitionAnimation: PageTransitionAnimation.fade,
//       );
//       // Navigator.pushNamed(context, Routes.main);
//       fabKey.currentState?.animate();
//     },
//     icon: const Icon(
//       Icons.add_card_outlined,
//       color: AppColors.green,
//     ),
//     textLeft: -135,
//     text: StringManager.createPile.tr(),
//   );
// }
