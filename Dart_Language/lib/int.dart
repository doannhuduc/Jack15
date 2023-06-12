import 'dart:math';

void main(List<String> args) {
  /// Tìm hiểu về int

// abs()

  int num1 = -10;
  int newNum1 = num1.abs();
  print(newNum1);

// toString()

  int num2 = 100;
  String strNum2 = num2.toString();
  print(strNum2);

// toDouble()

  int num4 = 5;
  double newNum4 = num4.toDouble();
  print(newNum4);

// compareTo()

  int num5 = 14;
  int num6 = 9;
  int result = num5.compareTo(num6);
  print(result);

// isEven

  int num7 = 16;
  bool num7IsEven = num7.isEven;
  print(num7IsEven);

// isOdd

  int num8 = 15;
  bool num8IsOdd = num8.isOdd;
  print(num8IsOdd);

// isNegative

  int num9 = -1;
  bool num9IsNegative = num9.isNegative;
  print(num9IsNegative);

// sign

  int num10 = -10;
  int signOfNum10 = num10.sign;
  print(signOfNum10);

// Random().nextInt()

  int num11 = Random().nextInt(10);
  print(num11);
}
