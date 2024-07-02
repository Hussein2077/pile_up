import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/models/common_type.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_state.dart';
import 'package:pile_up/features/create_pile/presentation/widgets/type_drop_down.dart';

import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'create_folder.dart';

class FoldersDropDown extends StatefulWidget {
  const FoldersDropDown({super.key});

  static CommonType? folderValue;

  @override
  State<FoldersDropDown> createState() => _FoldersDropDownState();
}

class _FoldersDropDownState extends State<FoldersDropDown> {
  @override
  void initState() {
    BlocProvider.of<GetUserFoldersBloc>(context).add(GetUserFoldersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserFoldersBloc, GetUserFoldersState>(
      builder: (context, state) {
        List<CommonType>? dropdownItems = [];
        if (state is GetUserFoldersSuccessMessageState) {
          dropdownItems = state.internModel
                  .map((e) => CommonType(nameEn: e.name, id: e.id))
                  .toList() ??
              [];

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Folder',
                    fontSize: AppSize.defaultSize! * 1.5,
                  ),
                  InkWell(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const CreateFolder(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                          fontSize: AppSize.defaultSize! * 1.8,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const TypesDropDown(),
            ],
          );

          //   ColumnWithTextField(
          //   text: StringManager.folder.tr(),
          //   requiredInput: true,
          //   text1: 'Create',
          //
          //   dropDown: CustomDropdownButton2(
          //     hint: 'Select a folder',
          //     value:FoldersDropDown. folderValue,
          //     dropdownItems:dropdownItems  ,
          //     onChanged: (CommonType? newValue) {
          //       FoldersDropDown.  folderValue = newValue;
          //       log('${FoldersDropDown.folderValue}folderName1');
          //     setState(() {
          //
          //     });
          //     },
          //   ),
          // );
        } else if (state is GetUserFoldersLoadingState) {
          return ColumnWithTextField(
            text: StringManager.folder.tr(),
            requiredInput: true,
            dropDown: CustomDropdownButton2(
              hint: 'Select a folder',
              value: null,
              dropdownItems: const [],
              onChanged: (CommonType? newValue) {},
            ),
          );
        } else if (state is GetUserFoldersErrorMessageState) {
          return ErrorWidget(state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
