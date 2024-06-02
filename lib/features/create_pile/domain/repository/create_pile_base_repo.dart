import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';

abstract class BaseRepositoryCreatePile {
  Future <Either<Map<String, dynamic>, Failure>> createPile(CreatePile pile);
}
