import 'package:flutter/material.dart';
import 'package:siteweb/models/User.dart';

import '../../constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String userId = "";
  String password = "";
  User user = User(id: "334488", password: "admin334488");
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Center(
          child: Container(
            width: 500,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enterer un id correcte';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      userId = value;
                    },
                    decoration:
                        kdecoTextForm.copyWith(hintText: "ID Utilisateur"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer un mot de passe correcte';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        kdecoTextForm.copyWith(hintText: "Mot de Passe"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate() &&
                            userId == user.id &&
                            password == user.password) {
                          final snackbar = SnackBar(content: Text("Connecté!"));
                          scaffoldKey.currentState!.showSnackBar(snackbar);
                          Navigator.of(context).pushNamed("/demandes");
                        }
                      });
                    },
                    child: Text("Connecter"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
