import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedScreen extends StatelessWidget{
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.red,),
    );
  }

}