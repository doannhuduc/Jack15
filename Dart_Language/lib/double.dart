import 'dart:math';

void main(List<String> args) {
  /// tìm hiểu double

// round()

  double num1 = 3.6;
  int newNum1 = num1.round();
  print(newNum1);

// roundToDouble()

  double num2 = 3.45;
  double newNum2 = num2.roundToDouble();
  print(newNum2);

// abs()
  double num3 = -10.223;
  double newNum3 = num3.abs();
  print(newNum3);

// toString()

  double num4 = 15.16;
  String strNum4 = num4.toString();
  print(strNum4);

// toInt()
  double num5 = 16.8;
  int integerNum5 = num5.toInt();
  print(integerNum5);

// isNegative

  double num6 = -17.8;
  bool num6IsNegative = num6.isNegative;
  print(num6IsNegative);

// sign

  double num7 = 0;
  double signOfNum7 = num7.sign;
  print(signOfNum7);
}
