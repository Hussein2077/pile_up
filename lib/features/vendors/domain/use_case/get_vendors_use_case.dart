import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';
import 'package:pile_up/features/vendors/data/model/vendor_model.dart';
import 'package:pile_up/features/vendors/domain/repository/vendor_base_repo.dart';

class GetVendorsUseCase {
  final BaseRepositoryVendors baseRepositoryVendors;

  GetVendorsUseCase({required this.baseRepositoryVendors});

  Future<Either<List<Vendor>, Failure>> getVendors() async {
    final result = await baseRepositoryVendors.getVendors();

    return result;
  }
}
