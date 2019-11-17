import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stripe_demo/pages/register.dart';
import 'package:stripe_demo/pages/login.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _prevConnectionStatus = 'Unknown';
  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          _connectionStatus = result.toString();
          print(_connectionStatus);

          if (result == ConnectivityResult.none){
            _prevConnectionStatus = 'none';
            showFloatingFlushbar(context,'You are offline','Please check your internet connection');
            setState(() {});
          }

          if ((result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) && _prevConnectionStatus == 'none') {
            _prevConnectionStatus = result == ConnectivityResult.wifi ? 'wifi' : 'mobile';
            showFloatingFlushbar(context,'You are back online','You can use the service now');
            setState(() {});
          }
        });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void showFloatingFlushbar(BuildContext context, String title, String message) {
    Flushbar(
//      aroundPadding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.blue.shade300,
      ),
      duration: Duration(seconds: 10),
      title: '$title',
      message: '$message',
    )..show(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/welcome.png', width: 190, height: 190),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 0),
                child: Text('Auto Ticket Classifier',
                    style: TextStyle(
                    fontSize: 30,
                    color: Colors.cyan[600],
                    letterSpacing: 2)
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text('Existing User?', style: TextStyle(color: Colors.cyan[800])),

                  ],
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(bottom: 0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: Login()));
                  },
                  child: Text('Login',
                      style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      letterSpacing: 1)
                  ),
                  textColor: Colors.greenAccent[800],

                  color: Colors.cyan,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text('New User? ', style: TextStyle(color: Colors.cyan[800])),

                  ],
                ),
              ),
              Container(
                width: 200,
                padding: EdgeInsets.all(0),
                child: FlatButton(
                  onPressed: (){

                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child: Register()));
                  },
                  child: Text('Register',
                      style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      letterSpacing: 1)),
                  textColor: Colors.greenAccent[800],
                  color: Colors.cyan,
//                  highlightedBorderColor: Colors.green,
//                  borderSide: BorderSide(color: Colors.greenAccent),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                )
              ),

            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}