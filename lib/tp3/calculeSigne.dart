import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculeSigne extends StatefulWidget {
  CalculeSigne({Key key}) : super(key: key);

  @override
  _CalculeSigneState createState() => _CalculeSigneState();
}

class _CalculeSigneState extends State<CalculeSigne> {
  final ctrlNombre1 = new TextEditingController();
  final ctrlNombre2 = new TextEditingController();

  String valueChoose;
  List listItem = ['ADITION', 'SOUSTRACTION', 'MULTIPLICATION', 'DIVISION'];
  double resultat = 0;

  double calcule() {
    if (valueChoose == 'ADITION') {
      resultat =
          double.parse(ctrlNombre1.text) + double.parse(ctrlNombre2.text);
    } else if (valueChoose == 'SOUSTRACTION') {
      resultat =
          double.parse(ctrlNombre1.text) - double.parse(ctrlNombre2.text);
    } else if (valueChoose == 'MULTIPLICATION') {
      resultat =
          double.parse(ctrlNombre1.text) * double.parse(ctrlNombre2.text);
    } else if (valueChoose == 'DIVISION') {
      resultat =
          double.parse(ctrlNombre1.text) / double.parse(ctrlNombre2.text);
    }
    return resultat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CALUCULER AVEC LES SIGNES")),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyTexteField(
                controller: ctrlNombre1,
                label: "NOMBRE 1",
                hintText: "Nombre 1",
              ),
              MyTexteField(
                controller: ctrlNombre2,
                label: "NOMBRE 2",
                hintText: "Nombre 2",
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text("SIGNE"),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 30,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: DropdownButton(
                hint: Text("Singne"),
                value: valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    valueChoose = newValue;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    child: Text(valueItem),
                    value: valueItem,
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            color: Colors.blue,
            // elevation: 9,
            onPressed: () {
              setState(() {
                calcule();
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
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text("REPONSE :"),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Text("$resultat"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTexteField extends StatelessWidget {
  final label;
  final hintText;
  final controller;
  final onChanged;
  const MyTexteField({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 13, left: 10),
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text("$label"),
        ),
        Container(
          padding: EdgeInsets.only(top: 13, left: 10),
          height: 30,
          width: MediaQuery.of(context).size.width * 0.3,
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
      ],
    );
  }
}
