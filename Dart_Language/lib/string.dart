import 'dart:math';
import 'dart:core';

void main(List<String> args) {
  /// Tìm hiểu về String

// split()

  String car = "toyota,yamaha,honda,lexus";
  List newCars = car.split(",");
  print(newCars);

// contains()

  String name = "Peter, Lindan, Messi";
  bool hasContains = name.contains(",");
  print(hasContains);

// toUpperCase()

  String capital = "HaNoi, LonDon, Paris, Moscow";
  String capitalUppercase = capital.toUpperCase();
  print(capitalUppercase);

// toLowerCase()

  String city = "Hai Phong, Hung Yen, Nam Dinh";
  String cityLowercase = city.toLowerCase();
  print(cityLowercase);

// indexOf()

  String club = "Manchester, Barcelona, Realmadrid";
  int index = club.indexOf("n");
  print(index);

// startsWith()

  String application = "zalo, facebook, tiktok";
  bool startWithZ = application.startsWith("z");
  bool startWithF = application.startsWith("f");
  print(startWithZ);
  print(startWithF);

// endsWith()

  String book = "Nha Gia Kim, Dac Nhan Tam";
  bool endWithM = book.endsWith("m");
  bool endWithA = book.endsWith("a");
  print(endWithM);
  print(endWithA);

// replaceAll()

  String greeting = "hello Mr.Thanh, hi Mr.Duc";
  String newGreeting = greeting.replaceAll("hello", "hi");
  print(newGreeting);

// replaceFirst()

  String address = "Hai Phong, Nam Dinh, Hai Phong";
  String newAddress = address.replaceFirst("Hai Phong", "Hai Duong");
  print(newAddress);

// trim()

  String space = " Dart Programing Language ";
  String deleteSpace = space.trim();
  print(deleteSpace);

// lastIndexOf()

  String brand = "Adidas, Nike, Fuma";
  int lastIndex = brand.lastIndexOf("ma");
  print(lastIndex);

// length

  String laptop = "dell, macbook, hp, asus";
  int lengthOfLaptop = laptop.length;
  print(lengthOfLaptop);

// isEmpty

  String network = "viettel, mobiphone, vinaphone";
  bool networkIsEmpty = network.isEmpty;
  print(networkIsEmpty);

// isNotEmpty

  String motobike = "yamaha, honda, suzuki";
  bool motobikeIsNotEmpty = motobike.isNotEmpty;
  print(motobikeIsNotEmpty);

// compareTo

  String milk = "TH, vinamilk, nutifood";
  String cafe = "Cappuccino, Macchiato";
  int result = milk.compareTo(cafe);
  print(result);

// subString

  String title = "Wellcome to Dart";
  String newTitle = title.substring(9, 11);
  print(newTitle);

// replaceRange()

  String soda = "pepsi, cocacola, mirinda";
  String newSoda = soda.replaceRange(0, 5, "spite");
  print(newSoda);

// int.parse()

  String str1 = "123";
  int num1 = int.parse(str1);
  print(num1);

// double.parse()

  String str2 = "456";
  double num2 = double.parse(str2);
  print(num2);

// int.tryParse()

  String str3 = "abc";
  int? newStr3 = int.tryParse(str3);
  print(newStr3);

// tdouble.tryParse()
  String str4 = "def";
  double? newStr4 = double.tryParse(str4);
  print(newStr4);

// Sử dụng $ và {}

  String str5 = "Messi";
  print("Hello $str5");
  print("Biến str5 có ${str5.length} ký tự");
}
