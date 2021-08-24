import 'package:ExercicesL2IG/constant/constant.dart';
import 'package:ExercicesL2IG/constant/data/DataProvider.dart';
import 'package:ExercicesL2IG/constant/models/client.dart';
import 'package:flutter/material.dart';

class Registre extends StatefulWidget {
  const Registre({Key key}) : super(key: key);

  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  Client client = new Client();
  DataApiProvider dataApiProvider = new DataApiProvider();
  final ctrlNom = new TextEditingController();
  final ctrlPostnom = new TextEditingController();
  final ctrlPrenom = new TextEditingController();
  final ctrlAdresse = new TextEditingController();
  final ctrlContact = new TextEditingController();
  final ctrlMail = new TextEditingController();
  final ctrlUsername = new TextEditingController();
  final ctrlPassword = new TextEditingController();
  var ctrlSexe = 'M';
  @override
  initState() {
    super.initState();
    // _getCurrentLocation();
  }

  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(),
        actions: [
          SizedBox(
            width: 55,
          )
        ],
        elevation: 0,
        backgroundColor: kTextLightColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  // height:,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    // color: kTextLightColor.withOpacity(.70),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "Registre",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MytextField(
                          controller: ctrlNom,
                          icone: Icons.person,
                          hintText: "Nom",
                        ),
                        MytextField(
                          controller: ctrlPostnom,
                          icone: Icons.person,
                          hintText: "Postnom",
                        ),
                        MytextField(
                          controller: ctrlPrenom,
                          icone: Icons.person,
                          hintText: "Prenom",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = true;
                                    ctrlSexe = 'M';
                                    print("Male");
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: isMale
                                            ? kTextLightColor
                                            : Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: kSecondColor,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: kSecondColor,
                                      ),
                                    ),
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                        color: kSecondColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = false;
                                    ctrlSexe = 'F';
                                    print("Female");
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: isMale
                                            ? Colors.white
                                            : kTextLightColor,
                                        border: Border.all(
                                          width: 1,
                                          color: kSecondColor,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        color: kSecondColor,
                                      ),
                                    ),
                                    Text(
                                      "Female",
                                      style: TextStyle(
                                        color: kSecondColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        MytextField(
                          controller: ctrlAdresse,
                          icone: Icons.location_on,
                          hintText: "Adresse",
                        ),
                        MytextField(
                          controller: ctrlContact,
                          icone: Icons.call,
                          hintText: "Contact",
                          isNumber: true,
                        ),
                        MytextField(
                          controller: ctrlMail,
                          icone: Icons.mail,
                          hintText: "Mail",
                        ),
                        MytextField(
                          controller: ctrlUsername,
                          icone: Icons.person,
                          hintText: "UserName",
                        ),
                        MytextField(
                          controller: ctrlPassword,
                          icone: Icons.lock,
                          hintText: "Passeword",
                          isPassword: true,
                        ),
                        MyButton(
                          action: () {
                            client.nom = ctrlNom.text;
                            client.postnom = ctrlPostnom.text;
                            client.prenom = ctrlPrenom.text;
                            client.sexe = ctrlSexe;
                            client.adresse = ctrlAdresse.text;
                            client.contact = ctrlContact.text;
                            client.mail = ctrlMail.text;
                            client.username = ctrlUsername.text;
                            client.password = ctrlPassword.text;
                            dataApiProvider
                                .saveClient(client: client)
                                .then((value) {
                              if (value.status) {
                                print("Saved succefully");
                              } else {
                                print(value.message);
                              }
                            });
                          },
                          icon: Icons.save,
                          nom: "Save",
                        )
                      ],
                    ),
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
