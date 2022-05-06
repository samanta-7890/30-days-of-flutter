import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/catalog.dart';
import 'package:flutter_app/drawer.dart';
import 'package:flutter_app/home_details_page.dart';
import 'package:flutter_app/itemwidget.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/theme.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';



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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluish).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailsPage(catalog: catalog)
             ),
            ),
            child: CatalogItem(catalog: catalog),
         );
        },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) :
        assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
              child: CatalogImage(imageUrl: catalog.imageUrl),
          ),
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl.color(MyTheme.darkBluish).make(),
              catalog.desc.text.caption(context).make(),
              10.heightBox,
              ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
               children: [
                 "\$${catalog.price}".text.bold.xl.make(),
                 ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                 style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                   shape: MaterialStateProperty.all(StadiumBorder(),
                   ),
                  ),
                 ),
               ],
              ).pOnly(right: 8),
            ],
          ))
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String imageUrl;

  const CatalogImage({Key? key, required this.imageUrl}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(
        context
    );
  }
}
