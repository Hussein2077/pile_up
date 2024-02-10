import 'package:flutter/material.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/cutom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';

class PileOptions extends StatefulWidget {
  const PileOptions({super.key});

  @override
  State<PileOptions> createState() => _PileOptionsState();
}

class _PileOptionsState extends State<PileOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Center(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: AppSize.defaultSize!*1.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 1.6,
              ),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                child: Container(
                  height: AppSize.defaultSize! * 15,
                  width: AppSize.screenWidth! * .92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AssetPath.image,
                            width: AppSize.defaultSize! * 7.2,
                            height: AppSize.defaultSize! * 7.2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: AppSize.defaultSize! * 7.2,
                                height: AppSize.defaultSize! * 2.4,
                                decoration: BoxDecoration(
                                    color: AppColors.green2,
                                    borderRadius: BorderRadius.circular(
                                        AppSize.defaultSize!)),
                                child: CustomText(
                                  text: 'Active',
                                ),
                              ),
                              SizedBox(
                                height: AppSize.defaultSize!,
                              ),
                              SizedBox(
                                width: AppSize.defaultSize! * 15,
                                child: CustomText(
                                  text:
                                      'it\'s Mohamed\'s birthday, so we should make a birthday for him.',
                                  maxLines: 3,
                                  fontSize: AppSize.defaultSize!,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      // SizedBox(height: AppSize.defaultSize!*1.6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MainButton(
                            text: 'Participate',
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                          ),
                          MainButton(
                            text: 'Preview',
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                          ),
                          SecondButton(
                            text: 'Close Pile',
                            height: AppSize.defaultSize! * 3.2,
                            width: AppSize.defaultSize! * 10.4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppSize.defaultSize!,),
              Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                  child: Container(
                    height: AppSize.defaultSize! * 7.5,
                    width: AppSize.screenWidth! * .92,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'AVAILABLE TO REDEEM',
                              fontSize: AppSize.defaultSize!*1.2,
                            ), CustomText(
                              text: 'EGP 750.00',
                              fontSize: AppSize.defaultSize!*2.2,
                              color: AppColors.green,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        MainButton(
                          text: 'Redeem',
                          height: AppSize.defaultSize! * 4,
                          width: AppSize.defaultSize! * 13.6,
                        ),

                      ],
                    ),
                  )),
              SizedBox(height: AppSize.defaultSize!*1.6,),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: 'Share Pile',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSize.defaultSize!*.8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shareContainer(icon: Icons.copy_all,text: 'Copy Link'),
                  shareContainer(icon: Icons.email_outlined,text: 'Via Email'),
                  shareContainer(icon: Icons.sms_failed_outlined,text: 'Via SMS'),
                  shareContainer(icon: Icons.qr_code_2_outlined,text: 'QR Code'),

                ],
              ),
              Expanded(child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppSize.defaultSize!),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
  shareContainer({IconData? icon,String? text}){
    return Container(
      height: AppSize.defaultSize! * 6.4,
      width: AppSize.defaultSize! * 8.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular( AppSize.defaultSize!),
        border: Border.all(color: AppColors.orange)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,color: AppColors.orange,),
          CustomText(
            text: text,
            fontSize: AppSize.defaultSize!*1.4,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
