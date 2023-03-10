import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:storage_exam/pages/homa_page.dart';
import 'package:storage_exam/pages/mainView.dart';
import 'package:storage_exam/storage/storage.dart';

import 'models/FoodModel.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoodModelAdapter());
  boks = await Hive.openBox('key');
  box = await Hive.openBox('foodList');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
