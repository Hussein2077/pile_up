import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/app_size.dart';
import 'package:pile_up/core/widgets/app_bar.dart';
import 'package:pile_up/core/widgets/custom_text.dart';
import 'package:pile_up/core/widgets/loading_widget.dart';
import 'package:pile_up/core/widgets/main_button.dart';
import 'package:pile_up/features/home/data/model/address_book_model.dart';
import 'package:pile_up/features/home/presentation/controller/get_address_bloc/get_address_bloc.dart';
import 'package:pile_up/features/home/presentation/controller/get_address_bloc/get_address_event.dart';
import 'package:pile_up/features/home/presentation/controller/get_address_bloc/get_address_state.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  @override
  void initState() {
BlocProvider .of<GetAddressBookBloc>(context).add(GetAddressBookEvent());
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar(context, text: StringManager.addressBook.tr(), isIcon: false),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.defaultSize! * 1.6),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: AppSize.defaultSize! * 2.4),
              child: SecondButton(
                  text: StringManager.addContact.tr(),
                  showIconAsset: false,
                  showIcon: false),
            ),
            BlocBuilder<GetAddressBookBloc, GetAddressBookState>(
              builder: (context, state) {
                if (state is GetAddressBookLoadingState) {
                  return const LoadingWidget();
                } else if (state is GetAddressBookSuccessMessageState) {
                  return ListView.builder(
                      itemCount: state.getAddressBook.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Contact(
                                showButton: true,
                                addressBookModel: state.getAddressBook[i],
                              ),
                            ),
                            if (i != 1) const Divider(),
                          ],
                        );
                      });
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact(
      {required this.showButton,
      super.key,
      required this. addressBookModel,});

  final bool showButton;
  final AddressBookModel addressBookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: addressBookModel.name,
              fontSize: AppSize.defaultSize! * 1.6,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: addressBookModel.email,
              fontSize: AppSize.defaultSize! * 1.6,
            ),
            CustomText(
              text: addressBookModel.phoneNumber,
              fontSize: AppSize.defaultSize! * 1.6,
            ),
          ],
        ),
        if ( !addressBookModel.hasAccount)
        SecondButton(
          height: AppSize.defaultSize! * 4.3,
          width: AppSize.defaultSize! * 12,
          text: 'INVITE',
          showIcon: true,
          showIconAsset: false,
          icon: Icons.person_add_alt_outlined,
          iconHeight: AppSize.defaultSize! * 1.7,
          iconColor: AppColors.primaryColor,
        )
      ],
    );
  }
}
