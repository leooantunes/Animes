import 'package:flutter/material.dart';
import 'package:giftlist/api/post_model.dart';
import 'package:giftlist/screens/home_screen.dart';

class LoginPage extends StatelessWidget {
  final _login = TextEditingController();
  final _senha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _login,
                  validator: (String text) {
                    if (text.isEmpty) {
                      return "Digite o login";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    fillColor: Colors.white,
                    labelText: "Login",
                    hintText: "Digite o seu login",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _senha,
                  validator: (String text) {
                    if (text.isEmpty) {
                      return "Digite a senha";
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
                    labelText: "Senha",
                    hintText: "Digite a sua senha",
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
                Container(
                  height: 46,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    child: Text("Login"),
                    onPressed: () {
                      bool formOk = _formKey.currentState.validate();
                      if (!formOk) {
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
