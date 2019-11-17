import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:stripe_demo/pages/appdrawer.dart';

class Classify extends StatefulWidget {
  @override
  _ClassifyState createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  final _formKey = GlobalKey<FormState>();
  final ticketdescController = TextEditingController();
  String pred = " ";
  String predMessage = " ";
  String predMessage2 = " ";

  Future getData(data) async {
    final String url = Uri.encodeFull('http://ticketclassifier.appspot.com/classifyticketapi/${data}/');
    print('URL is $url ');
    http.Response response = await http.get(url);
    print(response);

    if (response.statusCode == HttpStatus.ok) {
      pred = json.decode(response.body);
      print("prediction is $pred ");
      predMessage = "Your ticket has been auto-classified as ";
      predMessage2 = "and assigned to the support team";
    }
  }

  @override
  void dispose(){
    ticketdescController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classify Helpdesk Ticket'),
        backgroundColor: Colors.cyan[800],
      ),
      drawer: new AppDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter Ticket Description',
                      labelStyle: TextStyle(color: Colors.cyan[800], fontSize: 24),
                    ),
                    controller: ticketdescController,
                    maxLines: 8,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Ticket Description is required';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 30,
                  ),

                  RaisedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()){

                        var ticketdesc = ticketdescController.text;


                        print('Ticket Description: $ticketdesc ');
                        await getData(ticketdesc);
                        setState(() {

                        });

//                        Navigator.pushNamed(context, '/dashboard');
                      }
                    },
                    child: Text('Classify Ticket',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 1,
                    ),),
//                    textColor: Colors.white,
                    color: Colors.cyan[800],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('$predMessage $pred $predMessage2',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.cyan[800],
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


    );

  }
}

