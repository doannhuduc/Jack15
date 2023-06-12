void main(List<String> args) {
  /// BÀI 1

  String str1 =
      " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";

// Cách 1

  str1 = "Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)";
  print(str1);

// Cách 2

  String str2 =
      " đây là kết quả của buổi học thứ 2 về dart: dart basics (phần 1)...";
  String newStr2 = str2.trim();
  String newStr3 = newStr2.substring(0, 1).toUpperCase() +
      newStr2.substring(1, 14) +
      newStr2.substring(18, 37) +
      newStr2.substring(37, 38).toUpperCase() +
      newStr2.substring(38, 41).toLowerCase() +
      newStr2.substring(41, 53).toUpperCase() +
      newStr2.substring(54, 63);
  print(newStr3);

  /// BÀI 2

  List arr = [
    1,
    2,
    3,
    "đây",
    "kết",
    "là",
    true,
    false,
    {true: "buổi", 1: "học", 10.2: ":", false: "dart basics"},
    ['thứ', 'quả', 'về'],
    "(phần 1)",
    {"flutter": "dart"},
  ];

  /// Lấy data từ array trên và tạo ra 1 String với giá trị sau:
  /// Đây là kết quả buổi học thứ 2 về Dart: DART BASIC (phần 1)

  // ví dụ
  String s1 =
      "${arr[3].toString().substring(0, 1).toUpperCase()}${arr[3].toString().substring(1, 3)}";
   print("$s1"); // sẽ in ra "Đây" các ký tự sau tương tự như vậy.
}
