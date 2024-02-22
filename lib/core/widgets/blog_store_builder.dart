import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';

class BlogStoreBuilder extends StatelessWidget {
  const BlogStoreBuilder(
      {super.key, required this.stores, this.blog = false, this.width});

  final BlogStoreCardInfo stores;
  final bool blog;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth! * .95,
      // height: AppSize.defaultSize! * 10.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.defaultSize!)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: AppSize.defaultSize!),
                child: blog
                    ? CircleAvatar(
                        radius: AppSize.defaultSize! * 2.5,
                        backgroundImage: AssetImage(stores.image),
                      )
                    : Image.asset(
                        stores.image,
                        height: AppSize.defaultSize! * 13.1,
                        width: AppSize.defaultSize! * 12,
                      ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.defaultSize! * 1.6),
                    CustomText(
                        text: stores.text,
                        color: AppColors.blackLow,
                        fontSize: AppSize.defaultSize! * 1.5,
                        fontWeight: FontWeight.w700),
                    CustomText(
                        text: stores.description,
                        color: AppColors.blackLow,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        fontSize: AppSize.defaultSize! * 1.4),
                    !blog ?
                        CustomText(
                        text: 'See More',
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                        decorationColor: AppColors.primaryColor,
                        textDecoration: TextDecoration.underline,
                        fontSize: AppSize.defaultSize! * 1.6):
                    Container(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BlogStoreCardInfo {
  final String text;
  final String description;
  final String image;

  BlogStoreCardInfo(
      {required this.text, required this.description, required this.image});
}
