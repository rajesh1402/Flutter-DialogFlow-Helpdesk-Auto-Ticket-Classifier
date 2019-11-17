import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stripe_demo/pages/login.dart';
import 'package:stripe_demo/pages/dashboard.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
//  final confirmpasswordController = TextEditingController();

  @override
  void dispose(){
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
//    confirmpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Register',
            style: TextStyle(
                color: Colors.grey, fontSize: 15)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed('/signin');
              Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: Login()));

            },
            child: Text('Login', style: TextStyle(color: Colors.cyan, fontSize: 16)),
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
                        Text('REGISTER', style: TextStyle(
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
                              return 'User Name is required';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: 'Name'),
                          controller: nameController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Name is required';
                            }
                            return null;
                          },

                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email ID'),
                          controller: emailController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Email ID is required';
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

//                        TextFormField(
//                          decoration: InputDecoration(labelText: 'Confirm Password'),
//                          controller: confirmpasswordController,
//                          validator: (value){
//                            if(value.isEmpty){
//                              return 'Confirm Password is required';
//                            }
//                            return null;
//                          },
//
//                        ),
//                        SizedBox(
//                          height: 20,
//                        ),

                      ],
                    ),
                    Positioned(
                      bottom: 15,
                      right: -15,
                      child: FlatButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()) {
                            var username = usernameController.text;
                            var name = nameController.text;
                            var email = emailController.text;
                            var password = passwordController.text;
//                            var confirmpassword = confirmpasswordController.text;

                            print('User Name: $username Name: $name Email: $email Password: $password ');
                            //  Navigator.pushNamed(context, '/dashboard');

                            Navigator.pushReplacement(context, PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: Login()));
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
                height: 560,

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
                        bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20))),
              ),
            ],
          )
        ),
      ),
    );
  }
}