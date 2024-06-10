import 'package:equatable/equatable.dart';

class CommonType extends Equatable{
  final String nameEn;
  final int id;

  const CommonType({required this.nameEn, required this.id});

  @override
  List<Object> get props => [nameEn, id];
}