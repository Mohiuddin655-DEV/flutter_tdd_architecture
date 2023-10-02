import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../index.dart';

class MockRandomNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  MockRandomNumberTriviaRepository mockNumberTriviaRepository =
      MockRandomNumberTriviaRepository();
  GetRandomNumberTrivia usecase =
      GetRandomNumberTrivia(mockNumberTriviaRepository);

  setUp(() {
    mockNumberTriviaRepository = MockRandomNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(text: "test", number: 1);

  test(
    "should get trivia from the repository",
    () async {
      // arrange
      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));
      // act
      final result = await usecase(const NoParams());
      // assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
