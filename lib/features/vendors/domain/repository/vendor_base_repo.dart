import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/vendors/data/model/vendor_model.dart';

abstract class BaseRepositoryVendors {
  Future<Either<List<Vendor>, Failure>> getVendors();
}
