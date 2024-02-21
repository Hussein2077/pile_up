
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';
import 'package:pile_up/features/merchants/data/data_source/merchants_remote_data_source.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/repository/merchant_base_repo.dart';
import 'package:pile_up/features/vendors/data/data_source/vendors_remote_data_source.dart';
import 'package:pile_up/features/vendors/data/model/vendor_model.dart';
import 'package:pile_up/features/vendors/domain/repository/vendor_base_repo.dart';

class VendorsRepositoryImp extends BaseRepositoryVendors {
  final BaseRemotelyDataSourceVendors baseRemotelyDataSourceVendors;

  VendorsRepositoryImp({required this.baseRemotelyDataSourceVendors});

  @override
  Future<Either<List<Vendor>, Failure>> getVendors() async {
    try {
      final result = await baseRemotelyDataSourceVendors.getVendors();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}