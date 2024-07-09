import 'package:dartz/dartz.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/Participant.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class GetParticipantUseCase extends BaseUseCase<List<Participant> ,int> {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  GetParticipantUseCase({required this.baseRepositoryCreatePile});

  @override
  Future<Either<List<Participant>, Failure>> call(int parameter) async {
    final result = await baseRepositoryCreatePile.getParticipants(parameter);
    return result;
  }
}
