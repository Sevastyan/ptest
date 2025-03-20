import 'package:ptest/ptest.dart';
import 'package:test/test.dart';

void main() {
  pTest(
    'Example of a test.',
    generateInput: (random) => random.int(),
    body: (input) {
      final sut = toTestFun;

      expect(sut(input), input +1);
    },
  );
}

int toTestFun(int input) => /*input == 934 ? 934 :*/ input + 1;
