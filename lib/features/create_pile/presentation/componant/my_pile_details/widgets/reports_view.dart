import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/custom_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_state.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainButton(
            text: StringManager.downloadCSV.tr(),
            width: AppSize.defaultSize! * 15.2,
            widget: Icon(
              Icons.download,
              color: Colors.white,
              size: AppSize.defaultSize! * 2,
            ),
          ),
          SizedBox(
            height: AppSize.defaultSize!,
          ),
          Expanded(
            child: BlocBuilder<GetParticipantBloc, GetParticipantState>(
              builder: (context, state) {
                if (state is GetParticipantLoadingState) {
                  return const LoadingWidget();
                }
                if (state is GetParticipantSuccessMessageState) {
                  if (state.internModel.isNotEmpty) {
                    return ListView.builder(
                        itemCount: state.internModel.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              reportsRow(
                                  text:
                                      '${state.internModel[index].firstName} ${state.internModel[index].lastName}',
                                  text2: state.internModel[index].phoneNumber,
                                  text3:
                                      '${state.internModel[index].date.year}-${state.internModel[index].date.month}-${state.internModel[index].date.day}'),
                              if (index != state.internModel.length - 1)
                                const Divider(),
                            ],
                          );
                        });
                  } else {
                    return const EmptyWidget(
                      text: 'No Participated Members',
                    );
                  }
                }
                if (state is GetParticipantErrorMessageState) {
                  return ErrorWidget(state.errorMessage);
                } else {
                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget reportsRow({
    String? text,
    String? text2,
    String? text3,
  }) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return const PaymentDetailsDialog();
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: text,
                fontSize: AppSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: text2,
                fontSize: AppSize.defaultSize! * 1.4,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: text3,
                fontSize: AppSize.defaultSize! * 1.4,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: '100.0 EGP',
                fontSize: AppSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w600,
                color: AppColors.green,
              ),
              CustomText(
                text: 'Cash',
                fontSize: AppSize.defaultSize! * 1.6,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: 'Paid',
                fontSize: AppSize.defaultSize! * 1.4,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.greyColor.withOpacity(.7),
                size: AppSize.defaultSize! * 2,
              )),
        ],
      ),
    );
  }
}

class PaymentDetailsDialog extends StatelessWidget {
  const PaymentDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.screenHeight! * .2,
      ),
      child: Dialog(
        alignment: Alignment.topRight,
        insetPadding: EdgeInsets.only(
          top: AppSize.defaultSize! * 5,
          right: AppSize.defaultSize! * 1.6,
          left: AppSize.defaultSize! * 1.6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.defaultSize! * 2),
        ),
        child: Container(
          height: AppSize.screenHeight! * .48,
          width: AppSize.screenWidth! * .95,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.defaultSize!),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment details',
                      style: TextStyle(
                        fontSize: AppSize.defaultSize! * 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: AppColors.primaryColor,
                      size: AppSize.defaultSize! * 2,
                    ),
                  ],
                ),
                SizedBox(height: AppSize.defaultSize! * 2.4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'May Kenawi',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppSize.defaultSize! * 1.6),
                        child: const Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'exampl@domain.com',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppSize.defaultSize! * 1.6),
                        child: const Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '20/03/2023',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppSize.defaultSize! * 1.6),
                        child: const Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '100.0 EGP',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppSize.defaultSize! * 1.6),
                        child: const Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Method',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Credit card',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppSize.defaultSize! * 1.6),
                        child: const Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Paid',
                            style: TextStyle(
                              fontSize: AppSize.defaultSize! * 1.6,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
