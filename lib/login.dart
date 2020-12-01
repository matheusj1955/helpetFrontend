import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testando/api/dominio/login/loginUsuario.dart';
import 'package:testando/casdastro.dart';
import 'package:testando/posts.dart';
import 'package:testando/recuperarSenha.dart';

import 'api/dominio/login/service_login.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ServiceLogin serviceLogin = ServiceLogin();
    final emailField = TextEditingController();
    final senhaField = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Text("Login"),
          centerTitle: true, // this is all you need
          backgroundColor: Color(0xffa56336)),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          right: 40,
          left: 40,
        ),
        color: Colors.white,
          child: Form(
          key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
                width: 150,
                height: 120,
                child: Image.asset(
                  "images/teste.png",
                )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: _validarEmail,
              controller: emailField,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: _validarSenha,
              controller: senhaField,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => RecuperacaoSenha()));
                },              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 135,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.3, 1],
                        colors: [
                          Color(0xffa56336),
                          Colors.amber,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                      LoginUsuario loginUsuario = LoginUsuario(emailField.text,senhaField.text);
                      var login = await serviceLogin.postLogin(loginUsuario);
                        if(login == true){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Posts()));
                        }
                        else {
                            log("Erro ao logar");
                          }
                        }
                        },
                    child: Text(
                      "Entrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 135,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,

                        stops: [0.3, 1],
                        colors: [
                          Color(0xffa56336),
                          Colors.amber,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Posts()));
                    },
                    child: Text("Cancelar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Não possuo cadastro",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Cadastro()));
                },
              ),
            )
          ],
        ),
          ),
      ),
    );
  }
}

String _validarEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
      r'((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Informe o Email";
  } else if(!regExp.hasMatch(value)){
    return "Email inválido";
  }
//  else if(postagem.email == value){
//    return "Email já existente";
//  }
  else {
    return null;
  }
}

//_validarSenha
String _validarSenha(String value) {
  if (value.length == 0) {
    return "Informe uma senha";
  } else if(value.length < 3 || value.length > 30) {
    return "O nome deve conter de 3 a 10 caracteres";
  }
  return null;
}
