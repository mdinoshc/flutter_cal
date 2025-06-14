import 'package:calculatorapp/keys/keyz.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:math';
import 'qec.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  PackageInfo packageInfo = PackageInfo(appName: 'Unknown', packageName: 'Unknown', version: 'Unknown', buildNumber: 'Unknown');

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Widget Appdet(String app_text, String app_detail) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(app_text)
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(app_detail)
        ],
      ),
    );
  }

  double num1 = 0.0, num2 = 0.0, sum = 0.0;

  String firstPlaceHolder = "Enter number 1";
  String secondPlaceHolder = "Enter number 2";

  final TextEditingController t1 = new TextEditingController(text: "");
  final TextEditingController t2 = new TextEditingController(text: "");

  void doAddition() {
    try {
      setState(() {
        num1 = double.parse(t1.value.text);
        num2 = double.parse(t2.value.text);
        sum = num1 + num2;
      });
    } on Exception catch(exception) {
      print("Invalid Entries ");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doSubtraction() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1 - num2;
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doMultiplication() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1 * num2;
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doDivision() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1 / num2;
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doClear() {
    setState(() {
      t1.text = firstPlaceHolder;
      t2.text = secondPlaceHolder;
      sum = 0;
    });
  }

  void doModule() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = num1 % num2;
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doPower() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = pow(num1, num2).toDouble();
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  void doRoot() {
    try {
      setState(() {
        num1 = double.parse(t1.text);
        num2 = double.parse(t2.text);
        sum = pow(num1, (1 / num2)).toDouble();
      });
    } on Exception catch(FormatException) {
      print("Invalid Entries");
    } catch(e) {
      print("Error occurred");
    }
  }

  Widget calculation_button(GlobalKey<State> myKey, String btnname, Color btncolor, void btnaction()) {
    return new ElevatedButton(
      key: myKey,
        onPressed: btnaction,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.white)),
          backgroundColor: btncolor,
        ),
        child: Text(btnname)
    );
  }

  Widget textFieldNum(GlobalKey<State> newKey, String HT, TextEditingController txtCtrl) {
    return TextField(
      key: newKey,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(hintText: HT),
      controller: txtCtrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mini Dual Number Calculator"),
        centerTitle: true,
      ),
      persistentFooterButtons: [
        Appdet('App Version', packageInfo.version)
      ],
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Answer : $sum",
                style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              new TextField(
                key: testKeyz.firstNumKey,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: firstPlaceHolder),
                controller: t1,
              ),
              new TextField(
                key: testKeyz.secondNumKey,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(hintText: secondPlaceHolder),
                controller: t2,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calculation_button(testKeyz.AddBtn, "+", Colors.transparent, doAddition),
                  calculation_button(testKeyz.SubBtn, "-", Colors.transparent, doSubtraction)
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calculation_button(testKeyz.MultiplyBtn, "*", Colors.transparent, doMultiplication),
                  calculation_button(testKeyz.DivideBtn, "/", Colors.transparent, doDivision)
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    calculation_button(testKeyz.ModBtn, "Mod", Colors.transparent,doModule),
                    calculation_button(testKeyz.PowBtn, "Pow", Colors.transparent, doPower),
                    calculation_button(testKeyz.RootBtn, "Root", Colors.transparent, doRoot)
                  ]),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    calculation_button(testKeyz.ClrBtn, "Clear", Colors.transparent, doClear)
                  ]),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    key: testKeyz.QECBtn,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Qec()),
                        );
                      },
                      child: Container(
                          width: 200,
                          child: Center(
                            child: Text('Quadratic Equation Calculator'),
                          ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
