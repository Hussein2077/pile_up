
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/data/data_source/create_pile_remote_data_source.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class CreatePileRepositoryImp extends BaseRepositoryCreatePile{
  final BaseRemotelyDataSourceCreatePile baseRemotelyDataSourceCreatePile;

  CreatePileRepositoryImp({required this.baseRemotelyDataSourceCreatePile});

  @override
  Future<Either<Map<String, dynamic>, Failure>> createPile(CreatePile pile) async {
    try {
      final result = await baseRemotelyDataSourceCreatePile.createPile(pile);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<UserFolder>, Failure>> getUserFolders() async {
    try {
      final result = await baseRemotelyDataSourceCreatePile.getUserFolders();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}