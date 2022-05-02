import 'package:flutter/material.dart';
import 'package:flutter_app/catalog.dart';

// ignore: empty_constructor_bodies, empty_constructor_bodies
class ItemWidget extends StatelessWidget {

  final Item item;

  // ignore: use_key_in_widget_constructors
  const ItemWidget({Key? key, required this.item}) : assert(item != null),
        super(key :key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
          textScaleFactor: 1.5,
        ),
        onTap: (){
          print("${item.name} pressed");
        },
      ),
    );
  }
}
