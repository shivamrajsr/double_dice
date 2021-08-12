import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GridView.count(
        primary: false,
       // padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage("assets/images/dice6.png"),
                fit: BoxFit.cover,

              )
            ),
           // padding: const EdgeInsets.all(8),
            child:  FlatButton(onPressed: (){},
                child: Text("1+0",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),

          Container(
            decoration: BoxDecoration(
                color: Colors.teal[200],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/dice2.png"),
                  fit: BoxFit.cover,

                )
            ),
           // padding: const EdgeInsets.all(8),
            child: FlatButton(
              onPressed: (){},
                child: Text('2+0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/dice4.png"),
                  fit: BoxFit.cover,

                )
            ),
           //// padding: const EdgeInsets.all(8),
            child:  FlatButton(
                onPressed:(){},child: Text('3+0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

          ),
          Container(

            decoration: BoxDecoration(
                color: Colors.teal[400],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/dice1.png"),
                  fit: BoxFit.cover,

                )
            ),
           // padding: const EdgeInsets.all(8),
            child: FlatButton(
              onPressed: (){},
                child: Text("3+2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[500],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/dice3.png"),
                  fit: BoxFit.cover,

                )
            ),
            //padding: const EdgeInsets.all(8),
            child: FlatButton(onPressed: (){},
                child: Text('5+2',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.teal[600],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/dice5.png"),
                  fit: BoxFit.cover,

                )
            ),
          //  padding: const EdgeInsets.all(8),
            child:  FlatButton(
              onPressed: (){},
                child: Text('10+0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

          ),
        ],
      )
    );
  }
}
