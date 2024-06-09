import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/empty_widget.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_state.dart';
class FoldersDropDown extends StatefulWidget {
  const FoldersDropDown({super.key});

  @override
  State<FoldersDropDown> createState() => _FoldersDropDownState();
}

class _FoldersDropDownState extends State<FoldersDropDown> {
  @override
  void initState() {
    BlocProvider.of<GetUserFoldersBloc>(context).add(GetUserFoldersEvent());

    super.initState();
  }
  String? folderName1;
  @override
  Widget build(BuildContext context) {
    return
    BlocBuilder<GetUserFoldersBloc, GetUserFoldersState>(
      builder: (context, state) {
        if (state is GetUserFoldersSuccessMessageState) {
          if(state.internModel.isNotEmpty) {
            folderName1 = state.internModel[0].folderName;
          }
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
    );
  }
}
