import 'package:double_dice/routing/app_pages.dart';
import 'package:double_dice/screens/dice/dicepage.dart';
import 'package:double_dice/screens/dice/gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     //home:Routes.splashPage,
      initialRoute: Routes.splashPage,
      getPages: AppPages.routes,
      defaultTransition: Transition.leftToRight,

    );
  }
}


