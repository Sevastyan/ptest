import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:meta/meta.dart';
import 'package:test/test.dart';

@isTest
void pTest<T>(
  String description, {
  int? runCount,
  required Generator<T> generateInput,
  required Body<T> body,
}) async {
  final inputs = Iterable.generate(
    runCount ?? 100,
    (_) => generateInput(_deterministicRandom),
  ).iterator;

  final doesPassFun = _doesPass(body);

  test(description, () async {
    while (inputs.moveNext()) {
      final input = inputs.current;

      final doesPass = await doesPassFun(input);

      if (!doesPass) {
        stderr.writeln('Fails for input: $input');
        await body(input);
      }
    }
  });
}

typedef Generator<T> = T Function(Random random);
typedef Body<T> = FutureOr<void> Function(T input);

typedef _DoesPassFun<T> = Future<bool> Function(T input);

_DoesPassFun<T> _doesPass<T>(Body<T> body) => (input) async {
      try {
        await body(input);

        return true;
      } on Object {
        return false;
      }
    };

final _deterministicRandom = Random(20200313);
