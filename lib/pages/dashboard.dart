import 'package:flutter/material.dart';
import 'package:stripe_demo/pages/appdrawer.dart';

class Dashboard extends StatefulWidget {
  final String pageTitle;

  Dashboard({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,

          backgroundColor: Colors.green,
          title:
          Text('Ticket Classifier', style: TextStyle(
              fontSize: 21,
              letterSpacing: 2,
              color: Colors.white),
              textAlign: TextAlign.center),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Icons.alternate_email),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              iconSize: 21,
              icon: Icon(Icons.timer),
            )
          ],
        ),
        drawer: new AppDrawer(),
        body: Text('Classify Tickets'),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                title: Text(
                  'Store',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                title: Text(
                  'Favourites',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                title: Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.data_usage),
                title: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ))
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green[600],
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Index is $index');
    });
  }
}
