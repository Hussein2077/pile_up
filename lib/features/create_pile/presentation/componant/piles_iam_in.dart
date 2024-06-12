import 'package:animated_float_action_button/animated_floating_action_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/my_pile_details.dart';
import 'package:pile_up/features/create_pile/presentation/controller/piles_im_in_controller/piles_im_in_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/piles_im_in_controller/piles_im_in_state.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/my-pile_card.dart';

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
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
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
                size: AppSize.defaultSize!* 3.5,
              ),
            ),

            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
            BlocBuilder<GetPilesImInBloc,GetPilesImInState>(
              builder: (context,state) {
                if(state is GetPilesImInSuccessMessageState) {
                  return ListView.builder(
                  itemCount: state.internModel.length,
                  padding:   EdgeInsets.only(bottom: AppSize.defaultSize! * 3),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap:   true,
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap:  () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen:   MyPileDetails(pile:state.internModel[i],),
                            withNavBar: false,
                            pageTransitionAnimation:
                            PageTransitionAnimation.fade,
                          );
                        },
                        child:   MyPileCard(pile: state.internModel[i],));
                  },
                );
                }
                else if ( state is GetPilesImInErrorMessageState) {
               return ErrorWidget(state.errorMessage);
                }
                else if (state is GetPilesImInLoadingState){
               return const LoadingWidget();
                }
                else {
                  return const SizedBox();
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
