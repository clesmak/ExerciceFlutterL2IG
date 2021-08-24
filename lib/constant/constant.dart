import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kPrimaryColor = Color(0xFFFFC61F);
const kSecondColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

String valueChoose;
List listItem = ['M', 'F'];

class NumeroMenu {
  bool nav1 = true, nav2, nav3, nav4;
  bool getNav1() {
    return nav1;
  }

  void setNav1(bool nav) {
    this.nav1 = nav;
  }

  bool getNav2() {
    return nav2;
  }

  void setNav2(bool nav) {
    this.nav2 = nav;
  }

  bool getNav3() {
    return nav3;
  }

  void setNav3(bool nav) {
    this.nav3 = nav;
  }

  bool getNav4() {
    return nav4;
  }

  void setNav4(bool nav) {
    this.nav4 = nav;
  }

  void intiNavBar() {
    setNav1(false);
    setNav2(false);
    setNav3(false);
    setNav4(false);
  }
}

class MyTitle extends StatelessWidget {
  const MyTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              // ignore: deprecated_member_use
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "Exercice",
              style: TextStyle(color: kSecondColor),
            ),
            TextSpan(
              text: "I2IG",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class MytextField extends StatelessWidget {
  final icone;
  final controller;
  final isPassword;
  final hintText;
  final isNumber;
  const MytextField({
    Key key,
    this.icone,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: kSecondColor.withOpacity(0.32),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 10.0),
              blurRadius: 20.0,
              color: Color(0xFFFB0CCE1).withOpacity(0.15),
            )
          ],
          color: Colors.white),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icone,
            color: kSecondColor,
          ),
          hintText: "$hintText",
          hintStyle: TextStyle(color: kSecondColor),
        ),
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: [
          if (isNumber == true)
            // ignore: deprecated_member_use
            WhitelistingTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}

class MyDropDownField extends StatefulWidget {
  final icone;
  final controller;
  final isPassword;
  final hintText;
  final isNumber;
  const MyDropDownField({
    Key key,
    this.icone,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.isNumber = false,
  }) : super(key: key);

  @override
  _MyDropDownFieldState createState() => _MyDropDownFieldState();
}

class _MyDropDownFieldState extends State<MyDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: kSecondColor.withOpacity(0.32),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 10.0),
              blurRadius: 20.0,
              color: Color(0xFFFB0CCE1).withOpacity(0.15),
            )
          ],
          color: Colors.white),
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
    );
  }
}

TextButton buildButtonWith(
    {IconData icon, String title, Color backgroundColor}) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: kSecondColor),
        minimumSize: Size(145, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: Colors.white,
        backgroundColor: backgroundColor),
    child: Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          width: 5,
        ),
        Text("$title"),
      ],
    ),
  );
}

class MyListeTitle extends StatelessWidget {
  final titre;
  final action;
  final icon;
  final colors;
  const MyListeTitle({Key key, this.titre, this.action, this.icon, this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: ListTile(
        tileColor: colors,
        leading: Icon(icon),
        title: Text(
          "$titre",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kTextColor,
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final action;
  final nom;
  final icon;
  const MyButton({
    Key key,
    this.action,
    this.nom,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          height: 40.0,
          width: 150.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.20),
              )
            ],
            // color: Colors.white,
            color: kSecondColor,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 110,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text(
                  "$nom",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .apply(color: kTextLightColor),
                ),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(95.0),
                        topLeft: Radius.circular(95.0),
                        bottomRight: Radius.circular(200.0))),
              ),
              Icon(
                icon,
                size: 25,
                color: kTextLightColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyContrainerListe extends StatelessWidget {
  final itemListeView;
  const MyContrainerListe({
    Key key,
    this.itemListeView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: 495,
          child: itemListeView),
    );
  }
}

class MyListeType extends StatelessWidget {
  final action;
  final designation;

  final actionDelite;
  const MyListeType({
    Key key,
    this.action,
    this.designation,
    this.actionDelite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 40,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.select_all,
                color: kTextColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.72,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$designation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1,
              ),
              GestureDetector(
                onTap: actionDelite,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.delete,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListePartenaire extends StatelessWidget {
  final action;
  final designation;
  final idnat;
  final adresse;
  final actionDelite;
  const MyListePartenaire(
      {Key key,
      this.action,
      this.designation,
      this.idnat,
      this.adresse,
      this.actionDelite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.loyalty,
                color: kTextColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.70,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$designation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Text("$idnat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text("$adresse",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1,
              ),
              GestureDetector(
                onTap: actionDelite,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.delete,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListeBureau extends StatelessWidget {
  final action;
  final designation;
  final localisation;
  final partenaire;
  final actionDelete;
  const MyListeBureau({
    Key key,
    this.action,
    this.designation,
    this.localisation,
    this.partenaire,
    this.actionDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.work,
                color: kTextColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.72,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$designation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Text("$partenaire",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text("$localisation",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1,
              ),
              GestureDetector(
                onTap: actionDelete,
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.delete,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyListeVisitor extends StatelessWidget {
  final action;
  final name;
  final telephone;
  final sexe;
  const MyListeVisitor({
    Key key,
    this.action,
    this.name,
    this.sexe,
    this.telephone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: kTextColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kTextLightColor,
                          size: 10,
                        ),
                        Text("$telephone",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sexe: $sexe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListeAgent extends StatelessWidget {
  final nom;
  final prenom;
  final poste;
  final bureau;
  final sexe;
  final action;
  final actioDelete;
  const MyListeAgent({
    Key key,
    this.nom,
    this.prenom,
    this.poste,
    this.sexe,
    this.action,
    this.bureau,
    this.actioDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: kTextColor,
              ),
              VerticalDivider(
                width: 1,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.72,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$nom $poste",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Text("$bureau / $poste",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sexe : $sexe",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                width: 1,
              ),
              GestureDetector(
                onTap: actioDelete,
                child: Container(
                  height: 50,
                  width: 43,
                  color: Colors.transparent,
                  child: Icon(
                    Icons.delete,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListeCourrier extends StatelessWidget {
  final action;
  final expediteur;
  final numExpediteur;
  final lieuExpediteur;
  final destinateur;
  final numDestinateur;
  final lieuDestinateur;
  final isExpedition;
  const MyListeCourrier({
    Key key,
    this.action,
    this.expediteur,
    this.numExpediteur,
    this.lieuExpediteur,
    this.destinateur,
    this.numDestinateur,
    this.lieuDestinateur,
    this.isExpedition = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: action,
        child: Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.0, 20.0),
                blurRadius: 30.0,
                color: Color(0xFFFB0CCE1).withOpacity(0.10),
              )
            ],
            // color: Colors.white,
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                isExpedition
                    ? Icons.business_center
                    : Icons.business_center_outlined,
                color: kTextColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            "$expediteur",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kTextColor,
                                fontSize: 12),
                          ),
                        ),
                        Icon(
                          Icons.call,
                          color: kTextColor,
                          size: 10,
                        ),
                        Text("$numExpediteur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_on,
                          color: kTextColor,
                          size: 10,
                        ),
                        Text("$lieuExpediteur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                              fontSize: 9,
                            )),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        // Icon(
                        //   Icons.date_range_rounded,
                        //   color: kTextColor,
                        //   size: 10,
                        // ),
                        // Text("2020/01/01",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: kTextColor,
                        //       fontSize: 9,
                        //     )),
                      ],
                    ),
                    Divider(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: kTextLightColor,
                          size: 10,
                        ),
                        Text("$destinateur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.call,
                          color: kTextLightColor,
                          size: 10,
                        ),
                        Text("$numDestinateur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_on,
                          color: kTextLightColor,
                          size: 10,
                        ),
                        Text("$lieuDestinateur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextLightColor,
                              fontSize: 9,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyPopupMenuButton extends StatelessWidget {
//   final name;
//   final widgetToAction;
//   const MyPopupMenuButton({Key key, this.name, this.widgetToAction})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       itemBuilder: (BuildContext context) {
//         return <PopupMenuEntry>[
//           PopupMenuItem(
//             child: Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.of(context).size.width / 12),
//                 child: Text(
//                   "$name",
//                   style: TextStyle(color: kSecondColor),
//                 )),
//             value: "$name",
//           ),
//         ];
//       },
//       onSelected: (_) {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) {
//           return widgetToAction;
//         }));
//       },
//     );
//   }
// }

class MyButtonAdd extends StatelessWidget {
  final widgetToCall;
  final icon;
  const MyButtonAdd({
    Key key,
    this.widgetToCall,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widgetToCall));
      },
      child: Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kSecondColor, kPrimaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFFB0CCE1).withOpacity(0.25),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
