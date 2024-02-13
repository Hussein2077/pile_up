import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/features/home/presentation/componants/merchant_details/merchant_details.dart';
class OurMerchantCard extends StatelessWidget {
  const OurMerchantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const MerchantDetails(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Container(
        width: AppSize.defaultSize!*11.2,
        decoration: BoxDecoration(
          color: AppColors.greyLow,
          borderRadius: BorderRadius.circular(AppSize.defaultSize!*.5)
        ),
        child: Padding(
          padding:   EdgeInsets.all(AppSize.defaultSize!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Image.asset(AssetPath.kfc,

                height:AppSize.defaultSize!*5 ,
                ),
              ),
              // SizedBox(height: AppSize.defaultSize!,),

              CustomText(
                text: 'Fast Food',
                color: AppColors.greyColor,
                fontSize:AppSize.defaultSize!*1.2 ,
              ),
              CustomText(
                text: 'KFC',
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize:AppSize.defaultSize!*1.5 ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
