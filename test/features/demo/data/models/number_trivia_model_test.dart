import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import '../../../../index.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(
    text: "Test text",
    number: 1,
  );

  test(
    "should be a subclass of NumberTrivia entity",
    () async {
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    },
  );

  group("fromJson", () {
    test("should return a valid model when the JSON number is an integer", () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("trivia.json"));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
    test(
        "should return a valid model when the JSON number is regarded a double",
        () {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("trivia_double.json"));
      // act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert
      expect(result, tNumberTriviaModel);
    });
  });
}
