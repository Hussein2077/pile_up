import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_wallet/data/models/my_wallet_model.dart';

abstract class BaseRepositoryMyWallet {
  Future<Either<MyWalletModel, Failure>> getMyWallet();
}
