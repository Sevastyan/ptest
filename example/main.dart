import 'package:ptest/ptest.dart';
import 'package:test/expect.dart';

// Example of a function to test.
int triple(int value) => value * 3;

void main() {
  pTest(
    'Returns value that is 3 times bigger than the input.',
    generateInput: (random) => random.integer(),
    body: (input) {
      // System Under Test.
      const sut = triple;

      final actual = sut(input);

      expect(actual, input * 3);
    },
  );
}
