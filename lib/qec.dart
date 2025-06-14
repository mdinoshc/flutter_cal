import 'package:calculatorapp/keys/keyz.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Qec extends StatefulWidget {
  Qec();

  @override
  Q_ec createState() => Q_ec();
}

class Q_ec extends State<Qec> {
  var num1 = 0.0, num2 = 0.0, num3 = 0.0, sum1 = 0.0, sum2 = 0.0;

  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");
  final TextEditingController t3 = new TextEditingController(text: "");

  String firstPH = "Enter coefficient of x²(a)";
  String secondPH = "Enter coefficient x(b)";
  String thirdPH = "Enter constant(c)";

  void doClear() {
    setState(() {
      t1.text = firstPH;
      t2.text = secondPH;
      t3.text = thirdPH;
      sum1 = 0;
      sum2 = 0;
    });
  }

  void doCalculate() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        num3 = double.parse(t3.text);
        sum1 =
            ((-1 * num2) + pow(pow(num2, 2) - (4 * num1 * num3), 0.5)) / 2 * num1;
        sum2 =
            ((-1 * num2) - pow(pow(num2, 2) - (4 * num1 * num3), 0.5)) / 2 * num1;
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
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
                "Answer 1 : $sum1",
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
                "Answer 2 : $sum2",
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
                key: testKeyz.firstNumKeyQec,
                keyboardType: TextInputType.number,
                decoration:
                    new InputDecoration(hintText: firstPH),
                controller: t1,
              ),
              new TextField(
                key: testKeyz.secondNumKeyQec,
                keyboardType: TextInputType.number,
                decoration:
                    new InputDecoration(hintText: secondPH),
                controller: t2,
              ),
              new TextField(
                key: testKeyz.thirdNumKeyQec,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: thirdPH),
                controller: t3,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              ElevatedButton(
                key: testKeyz.CalBtn,
                  onPressed: doCalculate,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Container(
                      color: Colors.transparent,
                      width: 100,
                      child: Center(
                        child: Text('Calculate'),
                      ))),
              ElevatedButton(
                key: testKeyz.ClrQecBtn,
                  onPressed: doClear,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(color: Colors.white),
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
