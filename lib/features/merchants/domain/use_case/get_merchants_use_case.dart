import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';

class GetMerchantsUseCase {
  final BaseRepositoryMerchants baseRepositoryMerchants;

  GetMerchantsUseCase({required this.baseRepositoryMerchants});

  Future<Either<List<Merchant>, Failure>> getMerchants() async {
    final result = await baseRepositoryMerchants.getMerchants();

    return result;
  }
}
