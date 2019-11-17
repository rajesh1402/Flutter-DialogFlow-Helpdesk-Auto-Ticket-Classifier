import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan[800],
//          borderRadius: BorderRadius.all(Radius.circular(10.0),)
            ),
            accountName: Text('John Smith'),
            accountEmail: Text('johnsmith@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.cyan[200],
              backgroundImage: AssetImage("images/supportavatar.png") ,
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Classify Ticket'), onTap: () => Navigator.pushNamed(context, '/classify'),),
          Divider(color: Colors.grey[300], height: .6),
//          ListTile(leading: Icon(Icons.search), title: Text('Search'),),
//          Divider(color: Colors.grey[300], height: .6),
          ListTile(leading: Icon(Icons.chat), title: Text('Chat'),onTap: () => Navigator.pushNamed(context, '/chat'),),
          Divider(color: Colors.grey[300], height: .6),
          ListTile(leading: Icon(Icons.account_box), title: Text('Account'),),
          Divider(color: Colors.grey, height: .6),
          ExpansionTile(
            title: Text("Manage Tickets"),
            children: <Widget>[
              Divider(color: Colors.grey, height: .3),
              ListTile(leading: Icon(Icons.add_comment), title: Text('Add Ticket'),),

              Divider(color: Colors.grey, height: .6),
              ListTile(leading: Icon(Icons.add_to_queue), title: Text('View Tickets'),),
              Divider(color: Colors.grey, height: .6),

            ],

          ),
          Divider(color: Colors.grey, height: .6),
//          ListTile(
//            leading: Icon(Icons.close),
//            title: Text('Close'),
//            onTap: () => Navigator.of(context).pop(),
//          ),
//          Divider(color: Colors.grey[300], height: .6),
          ListTile(leading: Icon(Icons.rotate_left), title: Text('Logout'),),
          Divider(color: Colors.grey[300], height: .6),
        ],
      ),
    );
  }
}