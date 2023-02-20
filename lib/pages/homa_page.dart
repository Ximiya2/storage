import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storage_exam/items/food_item.dart';
import 'package:storage_exam/states.dart';
import '../storage/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var controller = TextEditingController();
  int son = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Блюда', style: TextStyle(color: Colors.black, fontSize: 20),),),
      body: Column(
        children: [
          SizedBox(
            height: 655,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: foodList.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    son = 1;
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image:DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage( foodList[index].image,)
                                          ),
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Text( foodList[index].name,style: TextStyle(fontSize: 20,fogntWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),
                                      Text( foodList[index].infos,maxLines: 4,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.grey.shade700),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_rounded, color: Colors.blue,),
                                          Text('15',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                          Text('мин',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                          SizedBox(width: 30,),
                                          Icon(Icons.share,),
                                        ],
                                      ),
                                      SizedBox(height: 25,),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 120,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 112,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                                  ),
                                                  child:  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: (){
                                                            setState(() {
                                                              if(son != 0)
                                                              {
                                                                son--;
                                                              };
                                                            });
                                                          },
                                                          icon: Icon(Icons.remove, size: 15,)),
                                                      Text(son.toString()),
                                                      IconButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            if(son >= 0)
                                                            {
                                                              son++;
                                                            };

                                                          });
                                                        },
                                                        icon: Icon(Icons.add,size: 15,),),
                                                    ],
                                                  ),
                                                ),
                                                Text('${foodList[index].cost} сум',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Divider(thickness: 1,color: Colors.white,),
                                            SizedBox(height: 8,),
                                            InkWell(
                                              onTap: (){
                                                if(son >= 1){
                                                  if(isExist(foodList[index].name) == true){
                                                   // box!.add(foodList[index]);
                                                    boks!.add({
                                                      'food' :  foodList[index],
                                                      'amount' : son
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      const SnackBar(
                                                        backgroundColor: Colors.green,
                                                        content: Text("Bu ovqat savatda bor!",),
                                                        duration: const Duration(seconds: 1),
                                                      ),
                                                    );
                                                  }
                                                }
                                                Navigator.pop(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.shopping_basket_rounded, color: Colors.black,),
                                                      SizedBox(width: 15,),
                                                      Text('Добавить в корзинку',style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),),
                                                    ],
                                                  ),
                                                  Icon(Icons.arrow_forward_rounded, color: Colors.black,),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )

                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: FoodItem(
                      context,
                    foodList[index],
                  ),
                );
                }
            ),
          )
        ],
      ),
    );
  }
}

bool isExist(String name) {
  bool hasFood = true;
  boks!.values.forEach((element) {
    if(element['food'].name == name){
      hasFood = false;
    }
  });
  return hasFood;
}
