import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
//  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body:
        Center(
          child: Image.asset("assets/images/dice6.png",width: 100,height: 100,color: Colors.red,
          fit: BoxFit.fill,)
        ),
      bottomNavigationBar: Container(
        width:200,
        height: 60,
        child: Center(
          child: Text(
            "welcome to the double dice",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,

          ),
          ),
        ),

    ),
    );
  }
}
