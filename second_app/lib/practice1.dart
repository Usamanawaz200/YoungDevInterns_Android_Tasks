import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Second PAge"),
      ),
      body: Center(
          child: Text("Hello Its second page")),
    );
  }
}