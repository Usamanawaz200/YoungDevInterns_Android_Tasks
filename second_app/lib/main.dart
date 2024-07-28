import 'dart:js';

import 'package:flutter/material.dart';
import 'package:second_app/practice1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Multiple Choice Questions"

        ),
      ),
      body:Center(
        child: Column(
          children: [
            Text("heloo"),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Secondpage() ));
            }, child: Text("Continue"))
          ],
        ),
      )


      ); // This trailing comma makes auto-formatting nicer for build method

  }
}
