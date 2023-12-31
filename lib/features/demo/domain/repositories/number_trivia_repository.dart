import 'package:dartz/dartz.dart';

import '../../../../index.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int? number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
