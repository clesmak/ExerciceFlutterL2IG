import 'package:ExercicesL2IG/constant/constant.dart';
import 'package:ExercicesL2IG/constant/data/DataProvider.dart';
import 'package:ExercicesL2IG/constant/models/client.dart';
// import 'package:ExercicesL2IG/constant/models/client.dart';
import 'package:ExercicesL2IG/tp4/registre.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ctrlUserName = new TextEditingController();
  final ctrlPassword = new TextEditingController();
  Login login = new Login();
  @override
  initState() {
    super.initState();
    // _getCurrentLocation();
  }

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
        backgroundColor: Colors.white,
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
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 70),
                    // color: kTextLightColor.withOpacity(.70),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            "Login",
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
                          controller: ctrlUserName,
                          icone: Icons.person,
                          hintText: "Name",
                        ),
                        MytextField(
                          controller: ctrlPassword,
                          isPassword: true,
                          icone: Icons.lock,
                          hintText: "Password",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyButton(
                              icon: Icons.check,
                              nom: "Login",
                              action: () {
                                DataApiProvider api = new DataApiProvider();
                                api
                                    .loginClient(
                                        username: ctrlUserName.text,
                                        password: ctrlPassword.text)
                                    .then((value) {
                                  if (value != null && value.status == true) {
                                    Client client =
                                        Client.fromJson(value.other);
                                    print(client.mail);
                                    // print(
                                    //     '88888888888888888888888888 ${value}');
                                    // Client client = Client.fromJson(value.message)
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home(client: client)));
                                  }
                                });
                              },
                            ),
                            MyButton(
                              icon: Icons.arrow_forward,
                              nom: "Registre",
                              action: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registre()));
                              },
                            ),
                          ],
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
