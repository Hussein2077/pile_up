
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';

import 'package:pile_up/features/my_wallet/data/data_source/my_wallet_remote_data_source.dart';
import 'package:pile_up/features/my_wallet/data/models/my_wallet_model.dart';
import 'package:pile_up/features/my_wallet/domain/repository/MyWallet_base_repo.dart';

class MyWalletRepositoryImp extends BaseRepositoryMyWallet {
  final BaseRemotelyDataSourceMyWallet baseRemotelyDataSourceMyWallet;

  MyWalletRepositoryImp({required this.baseRemotelyDataSourceMyWallet});

  @override
  Future<Either<MyWalletModel, Failure>> getMyWallet() async {
    try {
      final result = await baseRemotelyDataSourceMyWallet.getMyWallet();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}