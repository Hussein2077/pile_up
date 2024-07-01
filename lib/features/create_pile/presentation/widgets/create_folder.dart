import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';

import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/main_button.dart';

class CreateFolder extends StatelessWidget {
  const CreateFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Create Folder'),
      content: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ColumnWithTextField(
              text: 'Folder name',
              hintText: 'My Folder 01',
            ),
            SizedBox(
              height: AppSize.defaultSize! * 2,
            ),
            MainButton(
              text: StringManager.create.tr(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
