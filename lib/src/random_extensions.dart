import 'dart:core' as dart;
import 'dart:math';

extension RandomExtensions on Random {
  dart.int int({dart.int? max}) => nextInt(max ?? 1000);
}
