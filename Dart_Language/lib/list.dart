void main(List<String> args) {
// cách viết tắt không rõ nghĩa

  List strs_1 = ["a", "b", "c"];

// cách viết tắt rõ nghĩa, sử dụng [generic]

  List<String> strs_2 = ["d", "e", "f"];

// length

  List<int> nums_1 = [1, 2, 3, 4, 5, 8, 9];
  int lengthOfNum_1 = nums_1.length;
  print(lengthOfNum_1);

// add

  List<String> strs_3 = ["Messi", "Ronaldo", "Kaka"];
  strs_3.add("Kane");
  print(strs_3);

// insert()

  List<String> strs_4 = ["Nike", "Adidas", "Fuma"];
  strs_4.insert(1, "Reebok");
  print(strs_4);

// remove()

  List<int> num_2 = [1, 7, 9, 4, 7, 9];
  num_2.remove(7);
  print(num_2);

// removeAt()

  List<int> num_3 = [5, 8, 9, 3];
  num_3.removeAt(0);
  print(num_3);

// clear()

  List<int> num_4 = [1, 6, 5, 4, 2, 36, 5, 8, 8, 9];
  num_4.clear();
  print(num_4);

// contains()

  List<String> str_5 = ["mouse", "ruler", "pen", "eraser"];
  bool newStr_5 = str_5.contains("pen");
  print(newStr_5);

// sort()

  List<int> num_5 = [1, 5, 3, 6, 8, 9, 7];
  num_5.sort();
  print(num_5);

// addAll()

  List<int> num_6 = [1, 4, 3];
  List<int> num_7 = [1, 3, 6];
  num_6.addAll(num_7);
  print(num_6);

// sublist()

  List<int> num_8 = [1, 3, 5, 2, 4];
  List<int> num_9 = num_8.sublist(0, 3);
  print(num_9);

// indexOf()

  List<int> num_10 = [1, 2, 2, 3, 4];
  int newNum_10 = num_10.indexOf(2);
  print(newNum_10);

// lastIndexOf()

  List<int> num_11 = [1, 2, 3, 4, 2];
  int newNum_11 = num_11.lastIndexOf(2);
  print(newNum_11);

// forEach(callback)

  List<String> str_6 = ["honda", "yamaha", "suzuki"];
  str_6.forEach((str_7) => print(str_7));

// map(callback)

  List<int> num_12 = [1, 4, 5, 7, 8];
  Set num_13 = num_12.map((number) => number * 3).toSet();
  print(num_13);

// any()

  List<int> num_14 = [3, 4, 6, 8, 2];
  bool num_15 = num_14.any((number) => number % 15 == 0);
  print(num_15);

// every()
  List<int> num_16 = [2, 4, 6, 8];
  bool num_17 = num_16.every((number) => number % 2 == 0);
  print(num_17);

// replaceRange()

  List<int> num_18 = [1, 3, 6, 8, 9];
  num_18.replaceRange(0, 2, [2, 2]);
  print(num_18);

// reduce()

  List<int> num_19 = [1, 3, 5, 7, 9];
  int num_20 = num_19.reduce((value, element) => value + element);
  print(num_20);

// isNotEmpty

  List<String> str_8 = ["red", "blue", "green"];
  bool str_9 = str_8.isNotEmpty;
  print(str_9);

// isEmpty

  List<String> str_10 = ["red", "blue", "green"];
  bool str_11 = str_10.isEmpty;
  print(str_11);

// removeLast()

  List<int> str_12 = [1, 2, 3, 4];
  str_12.removeLast();
  print(str_12);

// reversed

  List<int> num_21 = [2, 4, 6, 8];
  List<int> num_22 = num_21.reversed.toList();
  print(num_22);

// where()

  List<int> num_23 = [1, 3, 5, 7, 9];

  List<int> num_24 = num_23.where((number) => number % 3 == 0).toList();
  print(num_24);

// toSet()

  List<int> num_25 = [1, 2, 3, 3, 3, 3, 4, 4];
  Set<int> num_26 = num_25.toSet();
  print(num_26);

// firstWhere()

  List<String> str_14 = ["chicken", "duck", "dog"];
  String str_15 = str_14.firstWhere((str) => str.contains("d"));
  print(str_15);

  List<int> num_27 = [2, 3, 6, 9, 15];
  int num_28 = num_27.firstWhere((number) => number % 3 == 0);
  print(num_28);

// lastWhere()

  List<int> num_29 = [2, 3, 6, 9, 15];
  int num_30 = num_29.lastWhere((number) => number % 3 == 0);
  print(num_30);

// asMap()

  List<int> num_31 = [1, 2, 3, 4, 5];
  Map<int, int> num_32 = num_31.asMap();
  print(num_32);

  List<String> str_16 = ["ball", "hat", "shoe"];
  Map<int, String> str_17 = str_16.asMap();
  print(str_17);

// expand()

  List<List<int>> num_33 = [
    [1, 2],
    [3, 4],
    [5, 6]
  ];
  List<int> num_34 = num_33.expand((total) => total).toList();
  print(num_34);

// indexWhere()

  List<int> num_35 = [3, 5, 10, 15, 10];
  int num_36 = num_35.indexWhere((number) => number % 5 == 0);
  print(num_36);

// insertAll()

  List<int> num_37 = [1, 3, 5];
  List<int> num_38 = [2, 4, 6];
  num_37.insertAll(3, num_38);
  print(num_37);

// lastIndexWhere()

  List<int> num_39 = [1, 4, 16, 3, 5];
  int num_40 = num_39.lastIndexWhere((number) => number.isOdd);
  print(num_40);

// removeRange()

  List<int> num_41 = [1, 2, 4, 6];
  num_41.removeRange(0, 2);
  print(num_41);

// removeWhere()

  List<int> num_42 = [1, 2, 3, 4];
  num_42.removeWhere((number) => number ~/ 4 == 1);
  print(num_42);

// retainWhere()

  List<int> num_43 = [1, 2, 3, 6, 9];
  num_43.retainWhere((number) => number.isEven);
  print(num_43);

// skip()

  List<int> num_44 = [1, 7, 9];
  List<int> num_45 = num_44.skip(2).toList();
  print(num_45);

// skipWhile()

  List<int> num_46 = [1, 2, 3, 4];
  List<int> num_47 = num_46.skipWhile((value) => value < 3).toList();
  print(num_47);

// take()

  List<int> num_48 = [100, 200, 300];
  List<int> num_49 = num_48.take(2).toList();
  print(num_49);

// takeWhile()

  List<int> num_50 = [80, 90, 100, 200];
  List<int> num_51 = num_50.takeWhile((value) => value < 100).toList();
  print(num_51);

// fold()

  List<int> num_54 = [1, 2, 8, 9];
  int num_55 =
      num_54.fold(10, (previousValue, element) => previousValue + element);
  print(num_55);

// join()

  List<String> str_18 = ["orange", "lemon", "banana"];
  String str_19 = str_18.join(", ");
  print(str_19);

// toString()

  List<int> num_56 = [80, 90, 100, 200];
  String num_57 = num_56.toString();
  print(num_57);

// cast

  List<dynamic> mixedList = ['apple', 1, 'banana', 2, 'orange', 3];

  List<String> stringList = mixedList.cast<String>();

  print(stringList);

  for (var item in stringList) {
    print(item);
  }
}
