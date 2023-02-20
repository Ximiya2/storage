import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_exam/models/FoodModel.dart';

Widget FoodItem(
  BuildContext context,
  FoodModel item,
) {
  return Container(
    margin: EdgeInsets.all(10),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Row(
      children: [
        Container(
          height: 80,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(item.image)),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${item.cost} сум',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    ),
  );
}
