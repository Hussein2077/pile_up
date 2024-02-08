import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/widgets/middle_carousel_card.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth!*.9,
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
                  color: AppColors.greyColor.withOpacity(.5),
                )
              ],
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return MiddleCarouselCard();
                }),
          ],
        ),
      ),
    );
  }
}
