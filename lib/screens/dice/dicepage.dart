
import 'dart:async';

import 'package:double_dice/data/models/location.dart';
import 'package:double_dice/data/models/response.dart';
import 'package:double_dice/data/repository/respository.dart';
import 'package:double_dice/screens/dice/dicepage_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class DicePage extends StatefulWidget {
 final Location location;
 DicePage({required this.location});

  @override
  _DicePageState createState() => _DicePageState(location);
}

class _DicePageState extends State<DicePage> {
  int leftdiceno=1;
  int rightdiceno=1;
  Location location;
  late Future<ResponseModel> response;

  _DicePageState(this.location);

 @override
 void initState(){
   super.initState();
  response= repository().getresponse();
 }
  Future<void> _refreshProducts(BuildContext context) async {
    
    //initState();
    setState(() {
      response =repository().getresponse();
    });
    // this calls the functions continuosly at 3 sec interval
    Timer(Duration(seconds: 7), (){
      _refreshProducts(context);
    });
  }


  void RollDice(){
    setState(() {
      leftdiceno= Random().nextInt(6)+1;
      rightdiceno= Random().nextInt(6)+1;
      response =repository().getresponse();

    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("DOUBLE-DICE",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,

        ),),
        centerTitle: true,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FlatButton(
                  onPressed: ()=>_refreshProducts(context),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //width: 300,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10),
                      //boxShadow: BoxShadow(color: Colors.cyanAccent,blurRadius: 2.0),
                    ),
                    child:  Center(
                      child: FutureBuilder<ResponseModel>(
                        future: response,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(snapshot.data!.quote,
                            style: TextStyle(
                              color: Colors.black,fontWeight: FontWeight.bold
                            ),);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex:1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(location.latitude.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    backgroundColor: Colors.white
                  ),),
                  Text(location.longitude.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        backgroundColor: Colors.white
                    ),)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
                child: Image.asset(
                  'assets/images/dice$leftdiceno.png'
                )
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
                child: Image.asset(
                    'assets/images/dice$rightdiceno.png')
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,

              child: FlatButton(
                highlightColor: Colors.lightGreenAccent,
                  onPressed: (){
                  RollDice();
              },
                  child: Container(

                    child: Center(
                      child: Text("Roll the dice",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent,
                      ),),
                    )
                  )
              ),
            ),
          ],
        ),
      ) ,

    );
  }
}
