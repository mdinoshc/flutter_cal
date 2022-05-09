import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cool_alert/cool_alert.dart';
import 'dart:math';

class Qec extends StatefulWidget {
  Qec();

  @override
  Q_ec createState() => Q_ec();
}

class Q_ec extends State<Qec> {
  var num1 = 0.0, num2 = 0.0, num3 = 0.0,
  sum1 = 0.0, sum2 = 0.0, d=0.0, sum1numer=0.0,
  sum2numer=0.0, den=0.0;

  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");
  final TextEditingController t3 = new TextEditingController(text: "");

  void doClear() {
    setState(() {
      t1.text = " ";
      t2.text = " ";
      t3.text = " ";
      sum1 = 0;
      sum2 = 0;
    });
  }

  void doCalculate() {
    setState(() {
      if(t1.text.isEmpty || t2.text.isEmpty || t3.text.isEmpty) {
        CoolAlert.show(
      context: context, 
      type: CoolAlertType.warning,
      text: "Please fill every fields..."
      );
      }else {
      num1 = double.parse(t1.text);
      num2 = double.parse(t2.text);
      num3 = double.parse(t3.text);
      d=num2*num2 - 4*num1*num3;
      den=2*num1;
      sum1numer=(-num2+pow(d,0.5));
      sum2numer=(-num2-pow(d,0.5));
      sum1=sum1numer/den;
      sum2=sum2numer/den;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quadratic Equation Calculator"),
        centerTitle: true,
      ),
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Equation type: ax²+bx+c",
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Text(
                "Answer 1 : ",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new SelectableText(
                "$sum1",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Text(
                "Answer 2 : ",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Text(
                "$sum2",
                style: new TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration:
                    new InputDecoration(hintText: "Enter coefficient of x² (a)"),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration:
                    new InputDecoration(hintText: "Enter coefficient x (b)"),
                controller: t2,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: "Enter constant (c)"),
                controller: t3,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              ElevatedButton(
                  onPressed: doCalculate,
                  style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: Container(
                      color: Colors.transparent,
                      width: 100,
                      child: Center(
                        child: Text('Calculate'),
                      ))),
                      new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              ElevatedButton(
                  onPressed: doClear,
                  style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: Container(
                      width: 100,
                      color: Colors.transparent,
                      child: Center(
                        child: Text('Clear'),
                      )
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
