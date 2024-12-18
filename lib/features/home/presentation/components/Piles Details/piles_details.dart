

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/cached_network_image.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_state.dart';
import 'package:pile_up/features/home/presentation/components/Piles%20Details/date_my_piles_row.dart';
import 'package:pile_up/features/home/presentation/components/Piles%20Details/participated_members.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';

class PilesDetails extends StatefulWidget {
  const PilesDetails({super.key, required this.pile});

  final Pile pile;

  @override
  State<PilesDetails> createState() => _PilesDetailsState();
}

class _PilesDetailsState extends State<PilesDetails> {
  bool seeMore = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkCustom(
                  url: widget.pile.banner ?? '',
                  width: AppSize.screenWidth,
                  height: AppSize.screenHeight! * .32,
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white)),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.6,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
              child: CustomText(
                text: widget.pile.title ?? '',
                fontSize: AppSize.defaultSize! * 2.4,
                fontWeight: FontWeight.w700,
                // color: Colors.white,
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 1.7,
            ),
            Center(
              child: SizedBox(
                width: AppSize.screenWidth! * .9,
                child: CustomText(
                  text: widget.pile.description ?? '',
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
                percent:
                    widget.pile.collectedAmount / widget.pile.totalAmount == 0
                        ? 0.008
                        : widget.pile.collectedAmount / widget.pile.totalAmount,
                backgroundColor: AppColors.black,
                center: percentColumn(widget.pile.collectedAmount.toString(),
                    widget.pile.totalAmount.toString()),
                progressColor: AppColors.green,
              ),
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2.4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyPilesDateRow(
                  dateTitle: StringManager.eventDate,
                  dateValue: widget.pile.eventDate.substring(0, 10),
                ),
                MyPilesDateRow(
                  dateTitle: StringManager.eventDeadline,
                  dateValue: widget.pile.deadline.substring(0, 10),
                ),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: StringManager.participatedMembers.tr(),
                      color: AppColors.black,
                      fontSize: AppSize.defaultSize! * 1.6,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  BlocBuilder<GetParticipantBloc, GetParticipantState>(
                    builder: (context, state) {
                      if (state is GetParticipantLoadingState) {
                        return const LoadingWidget();
                      }
                      if (state is GetParticipantSuccessMessageState) {
                        if(state.internModel.isNotEmpty) {
                          return Column(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.internModel.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return Column(
                                      children: [
                                        ParticipatedMembers(
                                          participant: state.internModel[i],
                                        ),
                                        const Divider(),
                                      ],
                                    );
                                  }),
                              // if (!seeMore)
                              //   TextButton(
                              //     onPressed: () {
                              //       seeMore = true;
                              //       setState(() {});
                              //     },
                              //     child: CustomText(
                              //       text: StringManager.seeMore.tr(),
                              //       color: AppColors.primaryColor,
                              //       textDecoration: TextDecoration.underline,
                              //       decorationColor: AppColors.orange,
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: AppSize.defaultSize! * 2,
                              //     ),
                              //   ),
                              // if (seeMore)
                              //   TextButton(
                              //     onPressed: () {
                              //       seeMore = false;
                              //       setState(() {});
                              //     },
                              //     child: CustomText(
                              //       text: StringManager.seeLess.tr(),
                              //       color: AppColors.orange,
                              //       textDecoration: TextDecoration.underline,
                              //       decorationColor: AppColors.orange,
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: AppSize.defaultSize! * 2,
                              //     ),
                              //   ),
                            ],
                          );
                        }
                        else {
                          return const EmptyWidget(text: 'No Participated Members',);
                        }
                      }
                      if (state is GetParticipantErrorMessageState) {
                        return ErrorWidget(state.errorMessage);
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),

                  SizedBox(
                    height: AppSize.defaultSize! * 2,
                  ),
                  if(widget.pile.userId!=MyProfile.getInstance().userId)
                  MainButton(text:  StringManager.participate.tr()),
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

  Widget percentColumn(String collected, total) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: collected,
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
          text: total,
          color: AppColors.black,
          fontSize: AppSize.defaultSize! * 1.6,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
