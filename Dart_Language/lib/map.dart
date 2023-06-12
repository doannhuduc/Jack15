void main(List<String> args) {
// cách viết ngắn gọn

  Map map_1 = {"color": "green", "int": 2, "double": 3.2};
  print(map_1);

// Cách viết rõ nghĩa

  Map<String, String> map_2 = Map<String, String>();
  map_2["country"] = "Spain";
  map_2["name"] = "Messi";
  map_2["age"] = "thirty six years old";
  print(map_2);

// length

  Map<String, dynamic> map_3 = Map<String, dynamic>();
  map_3["name"] = "Messi";
  map_3["age"] = 36;
  map_3["conutry"] = "Argentina";

  int map_4 = map_3.length;
  print(map_4);

//
}
