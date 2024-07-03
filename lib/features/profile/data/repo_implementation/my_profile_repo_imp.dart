
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/profile/data/data_source/my_profile_remote_data_source.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';
import 'package:pile_up/features/profile/domain/use_case/edit_my_profile_use_case.dart';

class MyProfileRepositoryImp extends BaseRepositoryMyProfile {
  final BaseRemotelyDataSourceMyProfile baseRemotelyDataSourceMyProfile;

  MyProfileRepositoryImp({required this.baseRemotelyDataSourceMyProfile});

  @override
  Future<Either<MyProfile, Failure>> getMyProfile() async {
    try {
      final result = await baseRemotelyDataSourceMyProfile.getMyProfile();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<String, Failure>> editMyProfile(EditProfileParams profile) async {
    try {
      final result = await baseRemotelyDataSourceMyProfile.editMyProfile(profile);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}