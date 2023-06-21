import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lession_1/add_to_do.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  bool valueFirst = false;
  bool valueSecond = true;
  bool delete = false;
  List<TodoModel> _listIncomplete = [
    TodoModel(
        isChecked: false,
        title: "Upload 1099-R to TurboTax",
        subTitle: "💰 Finance"),
    TodoModel(
        isChecked: false,
        title: "Submit 2019 tax return",
        subTitle: "💰 Finance"),
    TodoModel(
        isChecked: false,
        title: "Print parking passes",
        subTitle: "💞 Wedding"),
    TodoModel(
        isChecked: false,
        title: "Print parking passes",
        subTitle: "💞 Wedding"),
    TodoModel(
        isChecked: false,
        title: "Print parking passes",
        subTitle: "💞 Wedding"),
  ];
  List<TodoModel> _listCompleted = [
    TodoModel(
      isChecked: false,
      title: "Upload 1099-R to TurboTax",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var item = await showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddToDo();
            },
          );
          if (item != null) {
            _listIncomplete.add(item);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("To Do App")),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                height: 39,
                width: 228,
                child: Text(
                  getDateTime(),
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 18,
              ),
              Container(
                height: 17,
                width: 180,
                child: Text(
                  "${_listIncomplete.length} incomplete, ${_listCompleted.length} completed",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border(
            bottom: BorderSide(width: 2, color: Colors.black12),
          ))),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 18,
              ),
              Container(
                height: 24,
                width: 99,
                child: Text(
                  "Incomplete",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black54),
                ),
              ),
            ],
          ),

          // List View "Incomplete" ................................................................
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _listIncomplete.length,
            itemBuilder: (context, index) {
              var incomplete = _listIncomplete[index];
              return Container(
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          value: incomplete
                              .isChecked, ///////////////////////////////////////////////////////////////////////
                          onChanged: (value) {
                            if (value == true) {
                              _listIncomplete.remove(incomplete);
                              _listCompleted.add(incomplete);
                            }
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 48,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                incomplete.title ?? "Upload 1099-R to TurboTax",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              incomplete.subTitle ?? "💰 Finance",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      InkWell(
                        onTap: () {
                          _listIncomplete.removeAt(index);
                          setState(() {});
                        },
                        child: Visibility(
                            visible: true,
                            child: Container(
                              height: 20,
                              child: Center(child: Icon(Icons.delete)),
                            )),
                      ),
                    ]),
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 18,
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                height: 24,
                child: Text(
                  "Completed",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black54),
                ),
              ),
              // Listview Complete ........................................................................
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _listCompleted.length,
                itemBuilder: (context, index) {
                  var item = _listCompleted[index];
                  return Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {
                          if (value == false) {
                            _listCompleted.removeAt(index);
                            _listIncomplete.add(item);
                            setState(() {});
                          }
                        },
                      ),
                      Text(item.title ?? "Check on FedEx Order")
                    ],
                  );
                },
              )
            ],
          ),
        ]),
      ),
    );
  }

  String getDateTime() {
    var dateTime = DateTime.now();
    String formmatDate = DateFormat("MMMM dd, yyyy").format(dateTime);
    return formmatDate;
  }
}

class TodoModel {
  bool? isChecked;
  String? title;
  String? subTitle;
  TodoModel({this.isChecked, this.title, this.subTitle});
}
