import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pile_up/core/widgets/column_with_text_field.dart';

import '../../../../core/resource_manager/routes.dart';
import '../../../../core/resource_manager/string_manager.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../controller/create_folder/create_folder_bloc.dart';
import '../controller/create_folder/create_folder_event.dart';
import '../controller/create_folder/create_folder_state.dart';

class CreateFolder extends StatefulWidget {
  const CreateFolder({super.key});

  @override
  State<CreateFolder> createState() => _CreateFolderState();
}

class _CreateFolderState extends State<CreateFolder> {
  TextEditingController folderController = TextEditingController();

  @override
  void initState() {
    folderController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    folderController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddFolderBloc, AddFolderState>(
      listener: (context, state) {
        if (state is AddFolderSuccessMessageState) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, Routes.pilesDetails);
        } else if (state is AddFolderErrorMessageState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage);
        } else if (state is AddFolderLoadingState) {
          EasyLoading.show(status: 'loading...');
        } else {
          EasyLoading.dismiss();
        }
      },
      child:

      // CupertinoAlertDialog(title: Text('data'),)


      AlertDialog(
        backgroundColor: Colors.transparent,
        title: const Text('Create Folder'),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               ColumnWithTextField(
                controller: folderController,
                text: 'Folder name',
                hintText: 'My Folder 01',
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              MainButton(
                text: StringManager.create.tr(),
                onTap: () {
                  if (validation()) {
                    errorSnackBar(context, StringManager.enterFolderName.tr());
                  } else {
                    BlocProvider.of<AddFolderBloc>(context).add(AddFolderEvent(
                      folderName: 'Nn\$${folderController.text}',
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validation() {
    if (folderController.text == '') {
      return false;
    } else {
      return true;
    }
  }
}
