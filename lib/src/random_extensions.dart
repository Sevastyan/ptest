import 'dart:core';
import 'dart:math';

import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

extension RandomExtensions on Random {
  int integer({int? from, int? to}) {
    final f = from ?? 0;
    final t = to ?? 100;

    return f + nextInt(t - f + 1);
  }

  T fromSet<T>(Set<T> set) => set.elementAt(nextInt(set.length));

  String lowerCaseEnglishLetter({
    int? count,
  }) =>
      String.fromCharCodes(
        List.generate(
          count ?? 1,
          (_) => 97 + nextInt(26),
        ),
      );

  String upperCaseEnglishLetter({
    int? count,
  }) =>
      String.fromCharCodes(
        List.generate(
          count ?? 1,
          (_) => 65 + nextInt(26),
        ),
      );

  String printableAscii({int? count}) => String.fromCharCodes(
        List.generate(
          count ?? 1,
          (_) => 32 + nextInt(95),
        ),
      );

  String get uuidV4 => const Uuid().v4(
        config: V4Options(
          List.generate(nextInt(100) + 16, (_) => nextInt(255)),
          null,
        ),
      );

  /// Returns a set that can contain some or all of the [values], i.e. returns
  /// not a "proper subset", according to set theory.
  Set<T> subsetOf<T>(Iterable<T> values) =>
      (List.of(values)..shuffle(this)).take(integer(to: values.length)).toSet();
}
