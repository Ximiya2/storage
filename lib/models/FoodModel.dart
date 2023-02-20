import 'package:hive/hive.dart';
part 'FoodModel.g.dart';

@HiveType(typeId: 0)
class FoodModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String cost;
  @HiveField(2)
  String image;
  @HiveField(3)
  String infos;

  FoodModel({required this.name, required this.cost, required this.image, required this.infos});

}