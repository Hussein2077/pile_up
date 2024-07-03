import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';

class EditMyProfileUseCase {
  final BaseRepositoryMyProfile baseRepositoryMyProfile;

  EditMyProfileUseCase({required this.baseRepositoryMyProfile});

  Future<Either<String, Failure>> editMyProfile(EditProfileParams profile) async {
    final result = await baseRepositoryMyProfile.editMyProfile(profile);

    return result;
  }
}
class EditProfileParams {
  final String firstName;
  final String lastName;
  final String email;
final int reminder;
  EditProfileParams({ required this.firstName, required this.lastName, required this.email,required this.reminder});

}