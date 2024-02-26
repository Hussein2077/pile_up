import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/create_pile/presentation/controller/create_pile/create_pile_carousel_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_state.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/toggle_row.dart';

class CreatePileScreen extends StatefulWidget {
  const CreatePileScreen({super.key});

  @override
  State<CreatePileScreen> createState() => _CreatePileScreenState();
}

class _CreatePileScreenState extends State<CreatePileScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late TextEditingController participatedAmountController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    BlocProvider.of<CreatePileBloc>(context).add(CreatePileEvent());
    BlocProvider.of<GetUserFoldersBloc>(context).add(GetUserFoldersEvent());

    titleController = TextEditingController();
    amountController = TextEditingController();
    participatedAmountController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    participatedAmountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  DateTime eventDate = DateTime.now();
  DateTime deadlineDate = DateTime.now();
  String type = 'Birthday';
  Map<String, int> typeCategory = {
    'Birthday': 1,
    'Party': 2,
    'Wedding': 3,
  };
  bool totalCollectedPublic = false;
  bool showTotalReq = false;
  bool payerListPublic = false;
  bool editable = false;
  bool allowMsg = false;

  @override
  Widget build(BuildContext context) {
    String? folderName1;

    return Scaffold(
      appBar: homeAppBar(context,
          bottom: false,
          leading: false,
          widget: CustomText(
            text: StringManager.createPile.tr(),
            color: Colors.white,
            fontSize: AppSize.defaultSize! * 2.4,
            fontWeight: FontWeight.w700,
          )),
      body: SingleChildScrollView(
        child: BlocListener<CreatePileBloc, CreatePileState>(
          listener: (context, state) {
            if (state is CreatePileSuccessMessageState) {
              // successSnackBar(context, state.internModel['userId'].toString());
              successSnackBar(context, 'Pile is created Successfully!');
              titleController.text = '';
              descriptionController.text = '';
              amountController.text = '';
              participatedAmountController.text = '';
              eventDate = DateTime.now();
              deadlineDate = DateTime.now();

            } else if (state is CreatePileErrorMessageState) {
              errorSnackBar(context, 'Pile Error!');
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(AppSize.defaultSize! * 1.6),
                child: Container(
                  width: AppSize.screenWidth! * .92,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize!)),
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSize.defaultSize! * .5),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.defaultSize! * 1.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: AppSize.defaultSize! * 1.6,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: AppSize.screenHeight! * .2,
                              width: AppSize.screenWidth! * .84,
                              decoration: BoxDecoration(
                                  color: AppColors.greyColor3,
                                  border:
                                      Border.all(color: AppColors.greyColor4),
                                  borderRadius: BorderRadius.circular(
                                      AppSize.defaultSize!)),
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                                size: AppSize.defaultSize! * 7,
                              ),
                            ),
                          ),
                          ColumnWithTextField(
                            text: StringManager.title.tr(),
                            requiredInput: true,
                            controller: titleController,
                          ),
                          BlocBuilder<GetUserFoldersBloc, GetUserFoldersState>(
                            builder: (context, state) {
                              if (state is GetUserFoldersSuccessMessageState) {
                                folderName1 = state.internModel[0].folderName;
                                return ColumnWithTextField(
                                  text: StringManager.folder.tr(),
                                  requiredInput: true,
                                  dropDown: StatefulBuilder(
                                      builder: (context, setState) {
                                    return CustomDropdownButton2(
                                      hint: 'Select a folder',
                                      value: folderName1,
                                      dropdownItems: state.internModel
                                          .map((e) => e.folderName)
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        folderName1 = newValue;
                                        log('${folderName1}folderName1');
                                        setState(() {});
                                      },
                                    );
                                  }),
                                );
                              } else if (state is GetUserFoldersLoadingState) {
                                return const LoadingWidget();
                              } else if (state
                                  is GetUserFoldersErrorMessageState) {
                                return ErrorWidget(state.errorMessage);
                              } else {
                                return const EmptyWidget();
                              }
                            },
                          ),
                          ColumnWithTextField(
                            text: StringManager.type.tr(),
                            dropDown: CustomDropdownButton2(
                              hint: '',
                              value: type,
                              dropdownItems: const [
                                'Birthday',
                                'Party',
                                'Wedding',
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  type = newValue!;
                                });
                              },
                            ),
                          ),
                          ColumnWithTextField(
                            text: StringManager.totalAmount.tr(),
                            keyboardType: TextInputType.phone,
                            controller: amountController,
                          ),
                          ColumnWithTextField(
                            text: StringManager.participatedAmount.tr(),
                            keyboardType: TextInputType.phone,
                            controller: participatedAmountController,
                          ),
                          ColumnWithTextField(
                            text: StringManager.deadline.tr(),
                            readOnly: true,
                            hintText: deadlineDate.toString().substring(0, 10),
                            suffixIcon:
                                const Icon(Icons.calendar_month_outlined),
                            onTap: () {
                              _deadlineDate(context);
                            },
                          ),
                          ColumnWithTextField(
                            text: StringManager.eventDate.tr(),
                            readOnly: true,
                            hintText: eventDate.toString().substring(0, 10),
                            suffixIcon:
                                const Icon(Icons.calendar_month_outlined),
                            onTap: () {
                              _eventDate(context);
                            },
                          ),
                          ColumnWithTextField(
                            text: StringManager.description.tr(),
                            maxLine: 15,
                            controller: descriptionController,
                            height: AppSize.defaultSize! * 15.2,
                          ),
                          SizedBox(height: AppSize.defaultSize! * 2.4),
                          CustomSwitchRow(
                              text: StringManager.makeTotalCollectedPublic.tr(),
                              toggle: totalCollectedPublic),
                          SizedBox(height: AppSize.defaultSize! * 2.4),
                          CustomSwitchRow(
                              text: StringManager.showTotalRequired.tr(),
                              toggle: showTotalReq),
                          SizedBox(height: AppSize.defaultSize! * 2.4),
                          CustomSwitchRow(
                              text: StringManager.makePayerListPublic.tr(),
                              toggle: payerListPublic),
                          SizedBox(height: AppSize.defaultSize! * 2.4),
                          CustomSwitchRow(
                              text: StringManager.exactAmountOrEditable.tr(),
                              toggle: editable),
                          SizedBox(height: AppSize.defaultSize! * 2.4),
                          CustomSwitchRow(
                              text: StringManager
                                  .allowParticipantsToLeaveMessage
                                  .tr(),
                              toggle: allowMsg),
                          SizedBox(
                            height: AppSize.defaultSize! * 3.5,
                          ),
                          MainButton(
                            text: StringManager.create.tr(),
                            onTap: () {
                              if (titleController.text.isNotEmpty ||
                                  amountController.text.isNotEmpty ||
                                  participatedAmountController
                                      .text.isNotEmpty ||
                                  descriptionController.text.isNotEmpty) {
                                BlocProvider.of<CreatePileBloc>(context)
                                    .add(CreatePileEvent(
                                  userId:
                                      "d5ee16fe-727c-4446-b962-08dc3265bb1c",
                                  folderId: 1,
                                  pileName: titleController.text,
                                  description: descriptionController.text,
                                  ziad: 'Text by Omar',
                                  eventDate: eventDate,
                                  deadlineDate: deadlineDate,
                                  creationDate: DateTime.now(),
                                  totalAmount: int.parse(amountController.text),
                                  participationAmount: int.parse(
                                      participatedAmountController.text),
                                  status: true,
                                  pileImage: AssetPath.image,
                                  categoryId: typeCategory[type],
                                  collectedAmount: 0,
                                  totalCollectedPublic: totalCollectedPublic,
                                  showTotalRequired: showTotalReq,
                                  payerListPublic: payerListPublic,
                                  exactAmountOrNot: editable,
                                  allowPayerToLevMsg: allowMsg,
                                ));
                              } else {
                                errorSnackBar(context,
                                    StringManager.pleaseCompleteYourData.tr());
                              }
                            },
                          ),
                          SizedBox(
                            height: AppSize.defaultSize! * 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 8.8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _eventDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: eventDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != eventDate) {
      setState(() {
        eventDate = picked;
      });
    }
  }

  _deadlineDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: deadlineDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != deadlineDate) {
      setState(() {
        deadlineDate = picked;
      });
    }
  }
}


