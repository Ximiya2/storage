import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_exam/items/card_item.dart';
import '../storage/storage.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 655,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: boks!.values.length,
                itemBuilder: (context, index) {
                  return CardItem(
                      context,
                      boks!.getAt(index)!['food'],
                      boks!.getAt(index)!['amount'],
                      delete: () {
                        boks!.deleteAt(index);
                        setState(() {});
                  },
                      remove: () {
                        boks!.getAt(index)!['amount']--;
                        setState(() {});
                  },
                      add: () {
                        boks!.getAt(index)!['amount']++;
                        setState(() {});
                  });
                }),
          )
        ],
      ),
      floatingActionButton: Container(
        height: 40,
        width: MediaQuery.of(context).size.width - 60,
        margin: EdgeInsets.only(left: 100, right: 60),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'Оформить за ${totalPrice()} сум',
          ),
        ),
      ),
    );
  }
}

num totalPrice() {
  num sum = 0;
  boks!.values.forEach((element) {
    sum = sum + int.parse(element['food'].cost);
    sum += int.parse(element['food'].cost) * element['amount'];
  });
  return sum;
}
