
import 'package:Taco/Functions/authgate.dart';
import 'package:Taco/theme/theme_helper.dart';
import 'package:flutter/material.dart';


class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: appTheme.blue200Af,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/taco/TacobgLOGO.jpg'))),
          ),
ListTile(
            leading: Icon(Icons.emoji_emotions,color: appTheme.indigo400,),
            title: Text('Memories'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.emoji_people_sharp,color: appTheme.indigo400,),
            title: Text('Refer & Earn'),
            onTap: () => {},
          ),
    ListTile(
            leading: Icon(Icons.settings,color: appTheme.indigo400),
            title: Text('Settings'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.support_agent,color: appTheme.indigo400,),
            title: Text('Help & Support'),
            onTap: () => {},
          ),
          
          ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.redAccent),
            title: Text('Logout'),
            onTap: () => {signOut(context)},
          ),
          
        ],
      ),
    );
  }
}