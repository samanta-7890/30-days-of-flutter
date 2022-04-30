import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://flxt.tmsimg.com/assets/p170977_p_v7_ae.jpg";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("I am Iyaan", textScaleFactor: 1.2,),
              accountEmail: Text("samantacse2k16@gmail.com", textScaleFactor: 1.2,),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
            )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
                  title: Text("Home",
                    textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white,
                    ),
                  ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white),
              title: Text("Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
