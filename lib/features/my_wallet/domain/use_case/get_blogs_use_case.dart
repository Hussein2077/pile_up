import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_wallet/data/models/my_wallet_model.dart';
import 'package:pile_up/features/my_wallet/domain/repository/MyWallet_base_repo.dart';

class GetMyWalletUseCase {
  final BaseRepositoryMyWallet baseRepositoryMyWallet;

  GetMyWalletUseCase({required this.baseRepositoryMyWallet});

  Future<Either<MyWalletModel, Failure>> getMyWallet() async {
    final result = await baseRepositoryMyWallet.getMyWallet();

    return result;
  }
}
