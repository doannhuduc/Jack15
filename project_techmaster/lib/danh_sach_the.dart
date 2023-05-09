import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  String userName;
  ListCard({required this.userName});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  TextEditingController cardNoController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  String? cardNumber;

  String? cardName;

  List<CardInfor> _listCard = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Danh Sách Thẻ"))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            card(),
            signIn(),
            changeCard(),
          ],
        ),
      ),
    );
  }

  Widget card() {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          "assets/images/card.png",
        ),
      ),
      Positioned(
          bottom: 30,
          left: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNumber ?? '',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              Text(
                cardName ?? "",
                style: TextStyle(fontSize: 26, color: Colors.white),
              )
            ],
          ))
    ]);
  }

  Widget signIn() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          TextField(
            controller:
                cardNoController, //**************************************
            onChanged: (value) {
              cardNumber = value;
              setState(() {});
            },
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
                label: Text(
                  "Card No",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                )),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller:
                fullNameController, //************************************
            onChanged: (value) {
              cardName =
                  value; ////////////////////////////////////////////////////////
              setState(() {});
            },
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
                label: Text(
                  "FullName",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                // int n = (cardNumber ?? "").length;
                // if (n > 2) {
                //   List<String> a = (cardNumber ?? "").split("");

                //   cardNoController.text = a[0] + "***" + a[n - 2] + a[n - 1];
                // }

                _listCard.add(CardInfor(
                    cardNo: cardNoController
                        .text, ///////////////////////////////////////
                    fullName: fullNameController.text));
                cardNoController.text = "";
                fullNameController.text = "";

                setState(() {});
              },
              child: Text(
                "Thêm",
                style: TextStyle(fontSize: 18),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  fixedSize: MaterialStatePropertyAll(Size(400, 50))))
        ],
      ),
    );
  }

  Widget changeCard() {
    return Column(
      children: [
        Text("Danh sách thẻ của ${widget.userName}"),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _listCard.length,
            itemBuilder: (context, index) {
              var item = _listCard[index];
              return InkWell(
                child: card2(item.cardNo ?? "", item.fullName ?? ""),
                onTap: () {
                  _listCard.removeAt(index);
                  setState(() {});
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget card2(String cardNo, String cardName) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          "assets/images/card.png",
        ),
      ),
      Positioned(
          bottom: 30,
          left: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                aaa(cardNo),
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              Text(
                cardName,
                style: TextStyle(fontSize: 26, color: Colors.white),
              )
            ],
          ))
    ]);
  }

  String aaa(String a) {
    int n = a.length;
    if (n <= 2) {
      return a;
    }
    List<String> aa = a.split("");
    String b = aa[0] + "***" + aa[n - 2] + aa[n - 1];
    return b;
  }
}

class CardInfor {
  String? image;
  String? cardNo;
  String? fullName;
  CardInfor({
    this.image,
    this.cardNo,
    this.fullName,
  });
}
