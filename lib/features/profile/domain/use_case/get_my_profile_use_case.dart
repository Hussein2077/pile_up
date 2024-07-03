import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';

class GetMyProfileUseCase {
  final BaseRepositoryMyProfile baseRepositoryMyProfile;

  GetMyProfileUseCase({required this.baseRepositoryMyProfile});

  Future<Either<MyProfile ,Failure>> getMyProfile() async {
    final result = await baseRepositoryMyProfile.getMyProfile();

    return result;
  }
}
