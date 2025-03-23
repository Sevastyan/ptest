import 'dart:core';
import 'dart:math';

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
}
