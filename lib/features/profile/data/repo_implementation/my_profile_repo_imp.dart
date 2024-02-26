
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';
import 'package:pile_up/features/merchants/data/data_source/merchants_remote_data_source.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';
import 'package:pile_up/features/profile/data/data_source/my_profile_remote_data_source.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/repository/my_profile_base_repo.dart';

class MyProfileRepositoryImp extends BaseRepositoryMyProfile {
  final BaseRemotelyDataSourceMyProfile baseRemotelyDataSourceMyProfile;

  MyProfileRepositoryImp({required this.baseRemotelyDataSourceMyProfile});

  @override
  Future<Either<List<MyProfile>, Failure>> getMyProfile() async {
    try {
      final result = await baseRemotelyDataSourceMyProfile.getMyProfile();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}