import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/catalog.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/itemwidget.dart';
import 'dart:convert';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState()
  {
    super.initState();
    loadData();
  }

  loadData() async{
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) =>
        Item.fromMap(item))
        .toList();
    setState(() {

    });
    //print(productsData);
  }

  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.black),
        //backgroundColor: Colors.white,
        //elevation: 0.0,
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
            itemBuilder: (context ,index) {
          final item = CatalogModel.items[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(
                    child: Text(item.name,
                    style: TextStyle(color: Colors.white),
                    ),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.deepPurple),
                ),
                  child: Image.network(item.imageUrl),
                footer: Container(
                    child: Text(item.price.toString(),
                    style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.black),
                ),
              )
          );
            },
        itemCount: CatalogModel.items.length,
        )
      ),
      drawer: MyDrawer(),
    );
  }
}
