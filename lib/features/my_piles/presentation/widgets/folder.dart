import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/componants/Piles%20Details/piles_details.dart';
import 'package:pile_up/features/home/presentation/widgets/middle_carousel_card.dart';
import 'package:pile_up/features/my_piles/presentation/widgets/my-pile_card.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({super.key, required this.text, this.onTap});

  final String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth!*.92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.defaultSize!),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSize.defaultSize!),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: text,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSize.defaultSize! * 1.8,
                ),
                Icon(
                  Icons.edit,
                  size: AppSize.defaultSize!*2,
                  color: AppColors.greyColor.withOpacity(.5),
                )
              ],
            ),
            SizedBox(height: AppSize.defaultSize!*2.4,),
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return   Column(
                    children: [
                      InkWell(
                          onTap:onTap,
                          child: const MyPileCard()),
                      if(i!=1)
                      const Divider(),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
