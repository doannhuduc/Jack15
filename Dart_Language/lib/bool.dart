void main(List<String> args) {
// Cách khai báo và sử dụng bool
  bool a = true;
  bool b = false;

// cách viết tắt khi so sánh bool == true
  if (a) {
    print("a is $a");
  }

// cách viết rõ nghĩa
  if (a == true) {
    print("a == true");
  }

// cách viết tắt khi so sánh bool == false
  if (!b) {
    print("b is $b");
  }

// Cách khai báo và sử dụng khi so sánh nhiều mệnh đề

// So sánh nhiều mệnh đề, viết tắt

  if (a && !b) {
    print("a == true and b == false");
  }

// So sánh nhiều mệnh đề, viết tắt

  if (a || !b) {
    print("a == true or b == false");
  }
}
