import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';

abstract class BaseRepositoryMyProfile {
  Future<Either<List<MyProfile>, Failure>> getMyProfile();
}
