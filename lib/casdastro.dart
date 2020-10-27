import 'package:flutter/material.dart';
import 'package:testando/login.dart';
import 'package:testando/posts.dart';

import 'api/dominio/usuario/usuario.dart';
import 'api/dominio/usuario/usuario_service.dart';

class Cadastro extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
//TextFormField _nomeCadastro;

class _LoginState extends State<Cadastro> {

  ServiceUsuario serviceUsuario = ServiceUsuario();

  final nomeField = TextEditingController();
  final emailField = TextEditingController();
  final telefoneField = TextEditingController();
  final senhaField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cadastro"),
          centerTitle: true, // this is all you need
          backgroundColor: Color(0xffa56336)),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          right: 40,
          left: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
//            _nomeCadastro =
            TextFormField(
              controller: nomeField,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: telefoneField,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Telefone",
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
            SizedBox(
              height: 20,
            ),
            Row(
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
                    onPressed: () {
                      Usuario usuario = Usuario(null, nomeField.text, telefoneField.text, emailField.text);
                      serviceUsuario.PostUsuario(usuario);
                    },
                    child: Text(
                      "Cadastrar",
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
          ],
        ),
      ),
    );
  }
}
