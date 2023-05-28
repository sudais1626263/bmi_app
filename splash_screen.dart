import 'dart:async';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget{
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "",)));


    });
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.purple.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.line_weight_sharp, size: 100,color: Colors.black26,),
              Container(
                child: Text("The BMI app",style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold,),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}