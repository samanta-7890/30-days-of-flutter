import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/catalog.dart';
//import 'package:flutter_app/catalog.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/itemwidget.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.black),
        //backgroundColor: Colors.white,
        //elevation: 0.0,
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index){
            return ItemWidget(
              item: dummyList[index],
            );
          } ,
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
