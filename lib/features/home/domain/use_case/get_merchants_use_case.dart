import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/merchant_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';

class GetMerchantsUseCase {
  final BaseRepositoryHomeCarousel baseRepositoryMerchants;

  GetMerchantsUseCase({required this.baseRepositoryMerchants});

  Future<Either<List<Merchant>, Failure>> getMerchants() async {
    final result = await baseRepositoryMerchants.getMerchants();

    return result;
  }
}
