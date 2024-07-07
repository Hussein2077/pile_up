import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/resource_manager/routes.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/presentation/controller/create_pile/create_pile_carousel_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/folders_drop_down.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/pile_image.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/toggle_row.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/type_drop_down.dart';
import 'package:pile_up/features/main_screen.dart';

class EditPileScreen extends StatefulWidget {
  const EditPileScreen({super.key, required this.pile});

  final Pile pile;

  @override
  State<EditPileScreen> createState() => _EditPileScreenState();
}

class _EditPileScreenState extends State<EditPileScreen> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  late TextEditingController participatedAmountController;
  late TextEditingController descriptionController;
  late bool totalCollectedPublic ;
  late bool showTotalReq ;
  late bool payerListPublic ;
  late bool editable ;
  late bool allowMsg ;
  @override
  void initState() {
    titleController = TextEditingController();
    amountController = TextEditingController();
    participatedAmountController = TextEditingController();
    descriptionController = TextEditingController();
    titleController.text = widget.pile.title;
    amountController.text = widget.pile.totalAmount.toString();
    participatedAmountController.text =
        widget.pile.amountPerParticipant.toString();
    descriptionController.text = widget.pile.description;
    eventDate = DateTime.parse(widget.pile.eventDate);
    deadlineDate = DateTime.parse(widget.pile.deadline);
    totalCollectedPublic = widget.pile.totalCollectedPublic == 1 ? true : false;

    showTotalReq = widget.pile.totalRequiredPublic == 1 ? true : false;
    payerListPublic = widget.pile.payerListPublic == 1 ? true : false;
    editable = widget.pile.amountPerParticipantEditable == 1 ? true : false;
    allowMsg = widget.pile.messagesAllowed == 1 ? true : false;

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


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.screenHeight! * .85,
      width: AppSize.screenWidth!,
      child: SingleChildScrollView(
        child: BlocListener<CreatePileBloc, CreatePileState>(
          listener: (context, state) {
            if (state is EditPileSuccessMessageState) {
              EasyLoading.dismiss();
              EasyLoading.showSuccess('Pile Edit Successfully');
              BlocProvider.of<GetFoldersBloc>(context).add(GetFoldersEvent());
              MainScreen.mainIndex = 1;
              Navigator.pushNamed(context, Routes.main);
            } else if (state is EditPileErrorMessageState) {
              EasyLoading.dismiss();
              EasyLoading.showError(state.errorMessage);
            } else if (state is EditPileLoadingState) {
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
                          PileImage(
                            imagePath: widget.pile.banner,
                          ),
                          ColumnWithTextField(
                            text: StringManager.title.tr(),
                            requiredInput: true,
                            controller: titleController,
                          ),
                          FoldersDropDown(
                            initialFolderId: widget.pile.folderId,
                          ),
                          TypesDropDown(
                            initialFolderId: widget.pile.typeId,
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
                            text: StringManager.edit.tr(),
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
    BlocProvider.of<CreatePileBloc>(context).add(EditPileEvent(
      pileId: widget.pile.id,
      pileStatus: widget.pile.pileStatus,
      folderId: FoldersDropDown.folderValue?.id,
      pileName: titleController.text.isEmpty
          ? widget.pile.title
          : titleController.text,
      description: descriptionController.text.isEmpty
          ? widget.pile.description
          : descriptionController.text,
      image: PileImage.imageFile,
      eventDate: eventDate.toString(),
      deadlineDate: deadlineDate.toString(),
      totalAmount: amountController.text,
      participationAmount: participatedAmountController.text,
      typeId: TypesDropDown.typesValue?.id,
      totalCollectedPublic: totalCollectedPublic,
      showTotalRequired: showTotalReq,
      payerListPublic: payerListPublic,
      exactAmountOrNot: editable,
      allowPayerToLevMsg: allowMsg,
    ));

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
