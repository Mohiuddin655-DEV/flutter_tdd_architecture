import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../index.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, NumberParams> {
  final NumberTriviaRepository repository;

  const GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NumberParams params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class NumberParams extends Equatable {
  final int number;

  const NumberParams({
    required this.number,
  });

  @override
  List<Object?> get props => [number];
}
