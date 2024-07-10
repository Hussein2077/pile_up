
import 'package:equatable/equatable.dart';
import 'package:pile_up/features/home/data/model/address_book_model.dart';
import 'package:pile_up/features/home/data/model/blog_model.dart';

abstract class GetAddressBookState extends Equatable {
const GetAddressBookState();

@override
List<Object> get props => [];
}

class GetAddressBookInitial extends GetAddressBookState {}

class GetAddressBookLoadingState extends GetAddressBookState{
  const GetAddressBookLoadingState();
}

class GetAddressBookErrorMessageState extends GetAddressBookState{
  final String errorMessage ;

  const GetAddressBookErrorMessageState({required this.errorMessage});
}

class GetAddressBookSuccessMessageState extends GetAddressBookState{
  final List<AddressBookModel>  getAddressBook ;

  const GetAddressBookSuccessMessageState({ required this.getAddressBook});
}