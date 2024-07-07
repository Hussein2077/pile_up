import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/models/common_type.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';
import 'package:pile_up/core/widgets/drop_down_custom.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/features/create_pile/presentation/controller/types_bloc/types_bloc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/types_bloc/types_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/types_bloc/types_state.dart';

class TypesDropDown extends StatefulWidget {
  const TypesDropDown({super.key, this.initialFolderId});

  static CommonType? typesValue;
  final int ?initialFolderId;

  @override
  State<TypesDropDown> createState() => _TypesDropDownState();
}

class _TypesDropDownState extends State<TypesDropDown> {
  @override
  void initState() {
    BlocProvider.of<GetTypesBloc>(context).add(GetTypesEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTypesBloc, GetTypesState>(
      builder: (context, state) {
        List<CommonType>? dropdownItems = [];
        if (state is GetTypesSuccessMessageState) {
          dropdownItems = state.internModel
                  .map((e) => CommonType(nameEn: e.name, id: e.id))
                  .toList() ??
              [];
          if(widget.initialFolderId!=null){

            for (var element in dropdownItems) {
              if(element.id == widget.initialFolderId){
                TypesDropDown.  typesValue = element;
              }
            }
          }

          return ColumnWithTextField(
            text: StringManager.type.tr(),
            requiredInput: true,
            dropDown: CustomDropdownButton2(
              hint: 'Select a type',
              value: TypesDropDown.typesValue,
              dropdownItems: dropdownItems,
              onChanged: (CommonType? newValue) {
                TypesDropDown.typesValue = newValue;
                log('${TypesDropDown.typesValue}folderName1');

                setState(() {

                });
              },
            ),
          );
        } else if (state is GetTypesLoadingState) {
          return ColumnWithTextField(
            text: StringManager.type.tr(),
            requiredInput: true,
            dropDown: CustomDropdownButton2(
              hint: 'Select a folder',
              dropdownItems: [],
              onChanged: (CommonType? newValue) {},
              value: null,
            ),
          );
        } else if (state is GetTypesErrorMessageState) {
          return ErrorWidget(state.errorMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
