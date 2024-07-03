import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/use_case/edit_my_profile_use_case.dart';

abstract class BaseRepositoryMyProfile {
  Future<Either<MyProfile, Failure>> getMyProfile();
  Future<Either<String, Failure>> editMyProfile(EditProfileParams profile);
}
