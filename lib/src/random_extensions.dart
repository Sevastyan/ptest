import 'dart:core' as dart;
import 'dart:math';

extension RandomExtensions on Random {
  dart.int int({dart.int? max}) => nextInt(max ?? 1000);

  T fromSet<T>(dart.Set<T> set) => set.elementAt(nextInt(set.length));
}
