import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_exam/models/FoodModel.dart';
import '../storage/storage.dart';

Widget CardItem(BuildContext context, FoodModel item, int count,
    {required void Function() delete,
    required void Function() remove,
    required void Function() add}) {
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
            Container(
              height: 35,
              width: 112,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  IconButton(
                      onPressed: remove,
                      icon: Icon(
                        Icons.remove,
                        size: 15,
                      )),
                  Expanded(child: Text(count.toString())),
                  IconButton(
                    onPressed: add,
                    icon: Icon(
                      Icons.add,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: delete,
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            )),
      ],
    ),
  );
}
