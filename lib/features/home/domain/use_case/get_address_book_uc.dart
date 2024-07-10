import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/address_book_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';

class GetAddressBookUseCase {
  final BaseRepositoryHomeCarousel baseRepositoryAddressBook;

  GetAddressBookUseCase({required this.baseRepositoryAddressBook});

  Future<Either<List< AddressBookModel>, Failure>> getAddressBook() async {
    final result = await baseRepositoryAddressBook.getAddressBook();

    return result;
  }
}
