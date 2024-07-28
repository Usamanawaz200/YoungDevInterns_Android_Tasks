import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:pizza_app_flutter/buttons.dart';

class Cal extends StatefulWidget{
  @override
  State<Cal> createState() => HomePage();
}
class HomePage extends State<Cal>{
  String userInput = "";
  String result = "0";

  List<String> buttonList = [
    'C','(',')','/',
    '7','8','9','*',
    '4','5','6','+',
    '1','2','3','-',
    'AC','0','.','=',

  ];

  @override

  Widget build(BuildContext context){
    final screenSize= MediaQuery.of(context).size;
    return SafeArea(
           child: Scaffold(
             body: Column(
               children: [
                 Flexible(child: resultWidget(), flex:1 ),
                 Flexible(child: buttonWidget(), flex: 2,)
               ],
             ),
           ) ,
         );
  }
  Widget resultWidget(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(userInput
              ,style: const TextStyle(
              fontSize: 32
            ),
          ),
          //color: Colors.lightBlueAccent.shade200,
            ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerRight,
          child: Text(result
            ,style: const TextStyle(
                fontSize: 48,
              fontWeight: FontWeight.bold
            ),
          ),
         // color: Colors.lightBlueAccent.shade200,
           ),
      ],
    );
  }
  Widget buttonWidget(){
    return GridView.builder(
      itemCount: buttonList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return button(buttonList[index]);
      },
    );
  }
  
  Widget button(String text){
    return Container(
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: (){
          setState(() {
            handlebuttonpress(text);
          });
        },
        color: getColor(text),
        textColor: Colors.white,
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        shape: const CircleBorder(),
      ),
    );
  }
  getColor(String text)
  {
    if (text == "/" || text == "*"
    || text == "+" || text == "-"
    || text == "="){
      return Colors.orange;
    }
      if (text == "C" || text == "AC")
      {
        return Colors.red;
      }
      if ( text == "(" || text == ")"){
        return Colors.orange;
      }
      return Colors.blueGrey;
  }
  handlebuttonpress(String text){
    if (text == "AC"){
      userInput = "";
      result= "0";
      return;
    }
    if (text == "C"){
      userInput = userInput.substring(0,userInput.length-1);
      return;
    }

    if (text == "="){
      result = calculate();
      if ( result.endsWith(".0")) result = result.replaceAll(".0", "");
      return;
    }
    userInput= userInput+ text;
  }
   String calculate(){
    try{
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    }catch(e){
      return "Error";
    }
   }
}