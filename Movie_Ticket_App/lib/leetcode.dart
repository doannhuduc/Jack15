import 'dart:math';

void main(List<String> args) {
  int num = 123658;
  print(countDigits(num));

  String s = "abcdegml";
  String t = "ackbdgelm";
  print(findTheDifference(s, t));

  String a = "nice to meet you";
  print(lengthOflastWord(a));

  String jewels = "ab";
  String stones = "abbbcccccc";
  print(countJewelsInStones(jewels, stones));

  List<List<String>> items = [
    ["phone", "blue", "pixel"],
    ["computer", "silver", "lenovo"],
    ["phone", "silver", "iphone"]
  ];

  String ruleKey = "type";
  String ruleValue = "computer";
  print(countMatches(items, ruleKey, ruleValue));
}

// Bài 1 : Count the Digits That Divide a Number
// Cho một số nguyên num, trả về số chữ số trong num chia hết cho num.
// Một số nguyên val chia hết cho nums nếu nums % val == 0.

int countDigits(int num) {
// tạo biến "count" có kiểu dữ liệu int để đếm số chữ số trong "num" chia hết cho "num"
  int count = 0;

// chuyển số nguyên có kiểu dữ liệu int được cho ở đầu vào sang kiểu dữ liệu String
  String numString = num.toString();

// sử dụng vòng lặp for để duyệt qua từng phần tử trong "numString"

  for (int i = 0; i < numString.length; i++) {
// lấy giá trị số nguyên của từng phần tử trong biến "numString"

    int digits = int.parse(numString[i]);
    if (num % digits == 0) {
      count++;
    }
  }
  return count;
}

// Bài 2 : Find the Difference
// Bạn được cung cấp hai chuỗi s và t.
// Chuỗi t được tạo bằng cách xáo trộn chuỗi ngẫu nhiên s và sau đó thêm một chữ cái nữa vào một vị trí ngẫu nhiên.
// Trả lại chữ cái đã được thêm vào t.

String findTheDifference(String s, String t) {
  Map<String, int> count = {};

// Đếm số lượng xuất hiện của mỗi ký tự trong chuỗi s


  for (int i = 0; i < s.length; i++) {
    String char = s[i];
    count[char] = (count[char] ?? 0) + 1;
  }

// Trừ số lượng xuất hiện của mỗi ký tự trong chuỗi t

  for (int i = 0; i < t.length; i++) {
    String char = t[i];
    count[char] = (count[char] ?? 0) - 1;
    if (count[char] == -1) {
      return char;
    }
  }

// Trường hợp không có chữ cái bị thiếu, trả về chuỗi rỗng

  return '';
}

// Bài 3 : Length of Last Word
// Cho một chuỗi s bao gồm các từ và khoảng trắng, trả về độ dài của từ cuối cùng trong chuỗi.

int lengthOflastWord(String s) {
// xóa khoảng trắng ở đầu và cuối chuỗi s nếu có

  String newS = s.trim();

// tạo một danh sách "listNewS" để chứa các phần tử trong chuỗi newS được tách ra bằng khoảng trắng

  List<String> listNewS = newS.split("");

// Trả về độ dài của phần tử cuối cùng trong danh sách "listNewS"

  int lengthLastWord = (listNewS[listNewS.length - 1]).length;

  return lengthLastWord;
}

// Bài 4 : Jewels and Stones
// Bạn được cung cấp các chuỗi jewels đại diện cho các loại đá là đồ trang sức và stones đại diện cho những viên đá bạn có.
// Mỗi nhân vật trong stones là một loại đá mà bạn có. Bạn muốn biết bao nhiêu viên đá bạn có cũng là đồ trang sức.
// Các chữ cái phân biệt chữ hoa chữ thường, do đó "a"được coi là một loại đá khác với “A”

int countJewelsInStones(String jewels, String stones) {
// tạo biến count để đếm số lượng viên đá cũng là đồ trang sức
  int count = 0;

// thực hiện vòng lặp ở "stone" và đem từng phần tử ở "stone" đi so sánh với từng phần tử ở jewels.
// Nếu bằng nhau thì cộng thêm 1.
  for (int i = 0; i < jewels.length; ++i) {
    for (int j = 0; j < stones.length; ++j) {
      if (jewels[i] == stones[j]) {
        count++;
      }
    }
  }
  return count;
}

// Bài 5 : Count Items Matching a Rule

// Bạn được cho một mảng items, trong đó mỗi phần tử items[i] = [type_i, color_i, name_i] mô tả loại,
// màu sắc và tên của món hàng thứ i.
// Bạn cũng được cho một quy tắc được biểu diễn bởi hai chuỗi ruleKey và ruleValue.
// Phần tử thứ i được cho là phù hợp với quy tắc nếu một trong các điều sau đây là đúng:
// ruleKey = "type" và ruleValue = type_i.
// ruleKey = "color" và ruleValue = color_i.
// ruleKey = "name" và ruleValue = name_i.
// Trả về số lượng các phần tử phù hợp với quy tắc được cho.

int countMatches(List<List<String>> items, String ruleKey, String ruleValue) {
  int key = 0;
  int count = 0;

  if (ruleKey == "color") {
    key = 1;
  } else if (ruleKey == "name") {
    key = 2;
  }

  for (int i = 0; i < items.length; i++) {
    if (items[i][key] == ruleValue) count++;
  }
  return count;
}
