import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testando/api/dominio/postagens/postagem.dart';
import 'package:testando/api/dominio/postagens/service_postagem.dart';
import 'package:testando/posts.dart';

class Postar extends StatefulWidget {
  @override
  _PostarState createState() => _PostarState();
}

class _PostarState extends State<Postar> {

  ServicePostagem servicePostagem = ServicePostagem();

//  final donoField = TextEditingController();
  final usuarioField = TextEditingController();
  final telefoneField = TextEditingController();
  final petField = TextEditingController();
  final tituloField = TextEditingController();
  final msgField = TextEditingController();
//  final imgField = ImagePicker();


  List<DropdownMenuItem<String>> listTipoOcorrencia = [];
  List<DropdownMenuItem<String>> listEspecie = [];
  String selectTipo = null;
  String selectEspecie = null;

  File imagemGaleria;
  File imagemTemporaria;
  File imagemCamera;


  @override
  Widget build(BuildContext context) {
    loadTipo();
    loadEspecie();
    return Scaffold(
      appBar: AppBar(
          title: Text("Postar"),
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
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  iconSize: 100,
                  onPressed: () {
                    pegarImagemCamera();
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Posts()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  iconSize: 100,
                  onPressed: () {
                    pegarImagemGaleria();
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => Posts()));
                  },
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: imagemCamera != null ?
                  Image.file(imagemCamera) : Center(
                    child: Text(" "),
                  )
                ),
                Container(
                    height: 20,
                    width: 20,
                    child: imagemGaleria != null ?
                    Image.file(imagemGaleria) : Center(
                      child: Text(" "),
                    )
                ),
              ],
            ),
//            TextFormField(
//              controller: usuarioField,
//              keyboardType: TextInputType.text,
//              decoration: InputDecoration(
//                labelText: "Usuario",
//                labelStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 20,
//                ),
//              ),
//              style: TextStyle(fontSize: 20),
//            ),
//            TextFormField(
//              controller: petField,
//              keyboardType: TextInputType.text,
//              decoration: InputDecoration(
//                labelText: "Nome do Pet",
//                labelStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 20,
//                ),
//              ),
//              style: TextStyle(fontSize: 20),
//            ),
//            TextFormField(
//              controller: telefoneField,
//              keyboardType: TextInputType.phone,
//              decoration: InputDecoration(
//                labelText: "Telefone para contato",
//                labelStyle: TextStyle(
//                  color: Colors.black,
//                  fontSize: 20,
//                ),
//              ),
//              style: TextStyle(fontSize: 20),
//            ),
            TextFormField(
              controller: tituloField,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Título",
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 42,
                  value: selectTipo,
                  items: listTipoOcorrencia,
                  hint: Text("Tipo ocorrência"),
                  onChanged: (value) {
                    selectTipo = value;
                    setState(() {});
                  },
                  style: Theme.of(context).textTheme.title,
                ),
                new DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 42,
                  value: selectEspecie,
                  items: listEspecie,
                  hint: Text(
                    "Espécie",
                    textAlign: TextAlign.center,
                  ),
                  onChanged: (value) {
                    selectEspecie = value;
                    setState(() {});
                  },
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            ),
            new Form(
              child: new TextFormField(
                controller: msgField,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                    onPressed: () {
                      Postagem postagem = Postagem(null, tituloField.text,msgField.text, null); // imagemCamera ou ,imgField.getImage(source: ImageSource.camera)
                      postagem.imagem = imagemCamera;
                      servicePostagem.PostPostagem(postagem);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Posts()));
                    },
                    child: Text("Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                  ),
                ),
                SizedBox(
                  width: 10,
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
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void pegarImagemGaleria() async {
    imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagemGaleria = imagemTemporaria;
    });
  }

  void pegarImagemCamera() async {
    imagemTemporaria = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imagemCamera = imagemTemporaria;
    });
  }

  void loadTipo() {
    listTipoOcorrencia = [];
    listTipoOcorrencia.add(DropdownMenuItem(
      child: Text('Animal desaparecido'),
      value: "desaparecido",
    ));
    listTipoOcorrencia.add(new DropdownMenuItem(
      child: Text('Adoção'),
      value: "Adoção",
    ));
    listTipoOcorrencia.add(new DropdownMenuItem(
      child: Text('perdido'),
      value: "perdido",
    ));
  }

  void loadEspecie() {
    listEspecie = [];
    listEspecie.add(DropdownMenuItem(
      child: Text('Cachorro'),
      value: "Cachorro",
    ));
    listEspecie.add(new DropdownMenuItem(
      child: Text('Gato'),
      value: "Gato",
    ));
    listEspecie.add(new DropdownMenuItem(
      child: Text('Outros'),
      value: "Outros",
    ));
  }
}


