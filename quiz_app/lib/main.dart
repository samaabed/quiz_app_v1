
//write the full path of home_page
// first_app => gets u inside the lib folder
import 'package:first_app/pages/home_page.dart';

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first app',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );   
  }//build
}//MyApp


