import 'package:flutter/material.dart';
import 'package:giftlist/api/api_reset.dart';
import 'package:giftlist/api/api_response.dart';
import 'package:giftlist/screens/login_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ResetPage extends StatelessWidget {
  final _token = TextEditingController();
  final _password = TextEditingController();
  final _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: GradientAppBar(
        backgroundColorStart: Color.fromRGBO(231, 40, 74, 1),
        backgroundColorEnd: Color.fromRGBO(253, 146, 30, 1),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Container(
          child: Text(
            "Cadastrar nova senha",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 231, 40, 74),
                Color.fromARGB(255, 253, 146, 30),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _email,
                    validator: (String text) {
                      if (text.isEmpty) {
                        return "Digite um email válido";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      fillColor: Colors.white,
                      labelText: "Insira seu email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (String text) {
                      if (text.isEmpty) {
                        return "Digite uma senha válida";
                      }
                      if (text.length < 3) {
                        return "A senha precisa ter mais de 3 digitos";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Digite sua nova senha",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _token,
                    validator: (String text) {
                      if (text.isEmpty) {
                        return "Digite um token válido";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Digite seu token recebido no email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed: () async {
                        bool formOk = _formKey.currentState.validate();
                        if (!formOk) {
                          return;
                        }

                        String email = _email.text;
                        String senha = _password.text;
                        String codigo = _token.text;

                        ApiResponse response =
                            await ApiReset.reset(email,senha,codigo);

                        if (response.ok) {
                          _scaffoldkey.currentState.showSnackBar(SnackBar(
                            content: Text("Nova senha cadastrada com sucesso"),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ));
                          Future.delayed(Duration(seconds: 2)).then((_) {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                          });
                        } else {
                           _scaffoldkey.currentState.showSnackBar(SnackBar(
                            content: Text("Erro ao resetar a senha"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      child: Text(
                        "Enviar",
                        style: TextStyle(fontSize: 20),
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
