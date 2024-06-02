
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';
import 'package:pile_up/features/merchants/data/data_source/merchants_remote_data_source.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';

class MerchantsRepositoryImp extends BaseRepositoryMerchants {
  final BaseRemotelyDataSourceMerchants baseRemotelyDataSourceMerchants;

  MerchantsRepositoryImp({required this.baseRemotelyDataSourceMerchants});

  @override
  Future<Either<List<Merchant>, Failure>> getMerchants() async {
    try {
      final result = await baseRemotelyDataSourceMerchants.getMerchants();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}