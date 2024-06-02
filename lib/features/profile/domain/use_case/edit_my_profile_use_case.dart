import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';

class EditMyProfileUseCase {
  final BaseRepositoryMyProfile baseRepositoryMyProfile;

  EditMyProfileUseCase({required this.baseRepositoryMyProfile});

  Future<Either<Map<String, dynamic>, Failure>> editMyProfile(MyProfile profile) async {
    final result = await baseRepositoryMyProfile.editMyProfile(profile);

    return result;
  }
}