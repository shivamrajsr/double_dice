
import 'package:flutter/material.dart';
import 'dart:math';

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdiceno=1;
  int rightdiceno=1;
  void RollDice(){
    setState(() {
      leftdiceno= Random().nextInt(6)+1;
      rightdiceno= Random().nextInt(6)+1;
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
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Expanded(
              flex: 1,

              child: FlatButton(onPressed: (){
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
