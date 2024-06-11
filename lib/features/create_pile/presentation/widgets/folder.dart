import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/presentation/componant/my_pile_details/my_pile_details.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/my-pile_card.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({super.key, required this.folderModel, required this.showEditIcon,this.onTap});

  final FolderModel folderModel;

  final bool showEditIcon;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth!*.92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.defaultSize!),
        border: Border.all(color: AppColors.borderColor, width: .2),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: folderModel.name,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 1.8,
                ),
                showEditIcon? Icon(
                  Icons.edit,
                  size: AppSize.defaultSize!*2,
                  color: AppColors.greyColor.withOpacity(.5),
                ) : Container(),
              ],
            ),
            SizedBox(height: AppSize.defaultSize!*2.4,),
            Padding(
              padding:   EdgeInsets.all( AppSize.defaultSize!*.3),
              child: ListView.separated(
                  itemCount: folderModel.piles.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, i){
                    return const Divider();
                  },
                  itemBuilder: (context, i) {
                    return InkWell(
                        onTap:onTap?? () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen:   MyPileDetails(pile:folderModel.piles[i],),
                            withNavBar: false,
                            pageTransitionAnimation:
                            PageTransitionAnimation.fade,
                          );
                        },
                        child:   MyPileCard(pile: folderModel.piles[i],));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
