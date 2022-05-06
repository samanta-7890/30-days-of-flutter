import 'package:flutter/material.dart';
import 'package:flutter_app/catalog.dart';
import 'package:flutter_app/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog})
      :assert(catalog != null),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                shape: MaterialStateProperty.all(StadiumBorder(),
                ),
              ),
            ).wh(100,50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.imageUrl),
            ).h32(context),
           Expanded(child: VxArc(
             height: 30.0,
             edge: VxEdge.TOP,
             arcType: VxArcType.CONVEY,
             child: Container(
               color: Colors.white,
               width: context.screenWidth,
               child: Column(
                 children: [
                   catalog.name.text.bold.xl4.color(MyTheme.darkBluish).make(),
                   catalog.desc.text.xl.caption(context).make(),
                   10.heightBox,
                 ],
               ).py64(),
             ),
           ),
           )
          ],
        ),
      ),
    );
  }
}
