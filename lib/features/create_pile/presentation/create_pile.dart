import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/asset_path.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/core/widgets/snack_bar.dart';
import 'package:pile_up/features/create_pile/presentation/controller/create_pile/create_pile_carousel_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/folders_drop_down.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/pile_image.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/toggle_row.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/type_drop_down.dart';

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
  bool totalCollectedPublic = false;
  bool showTotalReq = false;
  bool payerListPublic = false;
  bool editable = false;
  bool allowMsg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
              EasyLoading.dismiss();
              EasyLoading.showSuccess('Pile Created Successfully');
              titleController.text = '';
              descriptionController.text = '';
              amountController.text = '';
              participatedAmountController.text = '';
              eventDate = DateTime.now();
              deadlineDate = DateTime.now();
            } else if (state is CreatePileErrorMessageState) {
              EasyLoading.dismiss();
              EasyLoading.showError(state.errorMessage);
            }
            else if (state is CreatePileLoadingState) {
            EasyLoading.show();
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
                          const PileImage(),
                          ColumnWithTextField(
                            text: StringManager.title.tr(),
                            requiredInput: true,
                            controller: titleController,
                          ),



                          const FoldersDropDown(),



                          const TypesDropDown(),
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
                              validation();
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

  validation() {
    if (titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        participatedAmountController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        PileImage.imageFile != null) {
      BlocProvider.of<CreatePileBloc>(context).add(CreatePileEvent(
        folderId: FoldersDropDown.folderValue!.id,
        pileName: titleController.text,
        description: descriptionController.text,
        image: PileImage.imageFile!,
        eventDate: eventDate.toString(),
        deadlineDate: deadlineDate.toString(),
        totalAmount:amountController.text,
        participationAmount:participatedAmountController.text,
        typeId: TypesDropDown.typesValue!.id,
        totalCollectedPublic: totalCollectedPublic,
        showTotalRequired: showTotalReq,
        payerListPublic: payerListPublic,
        exactAmountOrNot: editable,
        allowPayerToLevMsg: allowMsg,
      ));
    } else if (titleController.text.isEmpty) {
      errorSnackBar(context, StringManager.pleaseEnterTitle.tr());
    } else if (amountController.text.isEmpty) {
      errorSnackBar(context, StringManager.pleaseEnterTotalAmount.tr());
    } else if (participatedAmountController.text.isEmpty) {
      errorSnackBar(context, StringManager.pleaseEnterParticipatedAmount.tr());
    } else if (descriptionController.text.isEmpty) {
      errorSnackBar(context, StringManager.pleaseEnterDescription.tr());
    } else if (titleController.text.isEmpty &&
        amountController.text.isEmpty &&
        participatedAmountController.text.isEmpty &&
        descriptionController.text.isEmpty &&
        PileImage.imageFile == null) {}
    return false;
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
