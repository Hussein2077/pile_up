import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';

abstract class BaseRepositoryMerchants {
  Future<Either<List<Merchant>, Failure>> getMerchants();
}
