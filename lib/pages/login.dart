import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stripe_demo/CreditCardWidget.dart';
import 'package:stripe_demo/pages/register.dart';
import 'package:stripe_demo/pages/dashboard.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Login',
            style: TextStyle(
                color: Colors.grey, fontSize: 15)
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/signup');
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft,  child: Register()));

            },
            child: Text('Register', style: TextStyle(color: Colors.cyan, fontSize: 16)),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 18, right: 18),
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('LOGIN', style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 18,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w800,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'User Name'),
                          controller: usernameController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'User name is required';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          controller: passwordController,
                          obscureText: true,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Password is required';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 20,
                        ),


                      ],
                    ),
                    Positioned(
                      bottom: 15,
                      right: -15,
                      child: FlatButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()){

                            var username = usernameController.text;
                            var password = passwordController.text;

                            print('User Name: $username Password: $password');
//                            Navigator.pushNamed(context, '/dashboard');
                            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: CreditCardWidget()));
                          }

                        },
                        color: Colors.cyan,
                        padding: EdgeInsets.all(13),
                        shape: CircleBorder(),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    )
                  ],
                ),
                height: 360,

                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, .1),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 1))
                    ],
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)))
                ,
              ),
            ],
          )
        ),
      ),
    );
  }
}