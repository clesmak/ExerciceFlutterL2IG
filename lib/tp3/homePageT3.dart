import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculeSigne.dart';

class HomePageT3 extends StatefulWidget {
  HomePageT3({Key key}) : super(key: key);

  @override
  _HomePageT3State createState() => _HomePageT3State();
}

class _HomePageT3State extends State<HomePageT3> {
  final ctrlAlgo = new TextEditingController();
  final ctrlMath = new TextEditingController();
  final ctrlLangageC = new TextEditingController();
  final ctrlInfo = new TextEditingController();
  String valueChoose;
  double totalCote = 0;
  double pourcentage = 0;

  double calculePoucentage() {
    totalCote = double.parse(ctrlAlgo.text) +
        double.parse(ctrlMath.text) +
        double.parse(ctrlLangageC.text) +
        double.parse(ctrlInfo.text);
    pourcentage = (totalCote * 100) / 210;
    pourcentage = double.parse(pourcentage.toStringAsFixed(2));
    return pourcentage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("EXERCICES")),
        elevation: 9,
        actions: [
          IconButton(
              icon: Icon(Icons.trending_flat),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalculeSigne()));
              })
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyTexteField(
              controller: ctrlAlgo,
              label: "ALGO",
              hintText: "Cote d'algo",
              maximum: "60",
            ),
            MyTexteField(
              controller: ctrlMath,
              label: "MATH",
              hintText: "Cote de math",
              maximum: "45",
            ),
            MyTexteField(
              controller: ctrlLangageC,
              label: "LANGAGE C",
              hintText: "Cote de C",
              maximum: "75",
            ),
            MyTexteField(
              controller: ctrlInfo,
              label: "INFO",
              hintText: "Cote d'info",
              maximum: "30",
            ),
            RaisedButton(
              color: Colors.blue,
              // elevation: 9,
              onPressed: () {
                setState(() {
                  calculePoucentage();
                });
              },
              child: Text("CALCULER"),
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text("COTE TOTAL :"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Text("$totalCote"),
                ),
                Text(" /210"),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.27,
                  child: Text("POUCENTAGE :"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text("$pourcentage %"),
                ),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyTexteField extends StatelessWidget {
  final label;
  final hintText;
  final controller;
  final maximum;
  final onChanged;
  const MyTexteField({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.maximum,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text("$label : "),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 13, left: 10),
          height: 30,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "$hintText",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              // ignore: deprecated_member_use
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Text(" /$maximum")
      ],
    );
  }
}
