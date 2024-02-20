import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/home/presentation/componants/Piles%20Details/date_my_piles_row.dart';
import 'package:pile_up/features/home/presentation/componants/Piles%20Details/participated_members.dart';

class PilesDetails extends StatefulWidget {
  const PilesDetails({super.key});

  @override
  State<PilesDetails> createState() => _PilesDetailsState();
}

class _PilesDetailsState extends State<PilesDetails> {
  bool seeMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  AssetPath.image,
                  fit: BoxFit.fill,
                  width: AppSize.screenWidth,
                  height: AppSize.screenHeight! * .32,
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.defaultSize! * 1.5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ),
                Positioned(
                  top: AppSize.screenHeight! * .27,
                  left: AppSize.defaultSize! * 3,
                  child: CustomText(
                    text: 'Mohamed\'s Birthday',
                    fontSize: AppSize.defaultSize! * 2.4,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: AppSize.screenHeight! * .25,
                  child: Container(
                    height: AppSize.defaultSize! * 10,
                    width: AppSize.screenWidth!,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            // Colors.transparent,
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(.01),
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(.3),
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(.3),
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(.4),
                            const Color.fromRGBO(0, 0, 0, 1).withOpacity(.5),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.7,
            ),
            Center(
              child: SizedBox(
                width: AppSize.screenWidth! * .9,
                child: CustomText(
                  text:
                      'it\'s Mohamed\'s birthday, so we should make a birthday for her, it\'s Mohamed\'s birthday. it\'s Mohamed\'s birthday, so we should make a birthday for her, it\'s Mohamed\'s birthday.',
                  maxLines: 5,
                  color: AppColors.blackLow,
                  textAlign: TextAlign.start,
                  fontSize: AppSize.defaultSize! * 1.7,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2.4,
            ),
            Center(
              child: CircularPercentIndicator(
                radius: AppSize.defaultSize! * 8,
                lineWidth: AppSize.defaultSize! * 2,
                percent: .7,
                backgroundColor: AppColors.black,
                center: percentColumn(),
                progressColor: AppColors.green,
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2.4,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyPilesDateRow(dateTitle: StringManager.eventDate),
                MyPilesDateRow(dateTitle: StringManager.eventDeadline),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2.4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.defaultSize! * 2.8,
              ),
              child: Column(
                children: [
                  CustomText(
                    text: StringManager.participatedMembers.tr(),
                    color: AppColors.black,
                    fontSize: AppSize.defaultSize! * 1.6,
                  ),
                  SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: seeMore ? 10 : 4,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return const Column(
                              children: [
                                ParticipatedMembers(),
                                Divider(),
                              ],
                            );
                          })),
                  if (!seeMore)
                    TextButton(
                      onPressed: () {
                        seeMore = true;
                        setState(() {});
                      },
                      child: CustomText(
                        text: StringManager.seeMore.tr(),
                        color: AppColors.orange,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.defaultSize! * 2,
                      ),
                    ),
                  if (seeMore)
                    TextButton(
                      onPressed: () {
                        seeMore = false;
                        setState(() {});
                      },
                      child: CustomText(
                        text: StringManager.seeLess.tr(),
                        color: AppColors.orange,
                        textDecoration: TextDecoration.underline,
                        decorationColor: AppColors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.defaultSize! * 2,
                      ),
                    ),
                  SizedBox(
                    height: AppSize.defaultSize! * 2,
                  ),
                  MainButton(text: StringManager.participate.tr()),
                  SizedBox(
                    height: AppSize.defaultSize! * 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget percentColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: 'EGP 2550',
          color: AppColors.green,
          fontSize: AppSize.defaultSize! * 1.6,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          text: StringManager.collectedFrom.tr(),
          color: AppColors.blackMedium,
          fontSize: AppSize.defaultSize!,
          fontWeight: FontWeight.w700,
        ),
        CustomText(
          text: 'EGP 4000',
          color: AppColors.black,
          fontSize: AppSize.defaultSize! * 1.6,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
