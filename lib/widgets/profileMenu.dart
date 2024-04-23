
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
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {signOut(context)},
          ),
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text('Delete Account'),
            onTap: () => {signOut(context)},
          ),
        ],
      ),
    );
  }
}