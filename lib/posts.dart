import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testando/api/dominio/postagens/postagem.dart';
import 'package:testando/api/dominio/postagens/service_postagem.dart';
import 'package:testando/postar.dart';
import 'package:testando/telapost.dart';
import 'api/dominio/usuario/usuario.dart';
import 'api/dominio/usuario/usuario_service.dart';
import 'config.dart';
import 'login.dart';

class Posts extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Posts> {
  List<DropdownMenuItem<String>> listTipoOcorrenciaModal = [];
  List<DropdownMenuItem<String>> listEspecieModal = [];
  String selectTipoModal = null;
  String selectEspecieModal = null;
  String recebeImagem = null;

  ServicePostagem servicePostagem = ServicePostagem();
  ServiceUsuario serviceUsuario = ServiceUsuario();

  @override
  Widget build(BuildContext context) {
    loadTipo();
    loadEspecie();
    return Scaffold(
      appBar: AppBar(
          title: Text("Postagens"),
          centerTitle: true, // this is all you need
          backgroundColor: Color(0xffa56336)),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            color: Color(0xffa56336),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        stops: [0.3, 1],
                        colors: [
                          Colors.white,
                          Colors.amber,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
//                  child: FlatButton(
//                    onPressed: enviaId/*() {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (BuildContext context) => Config()));
//                    }*/,
                  child: Text("Config",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
                IconButton(
                  icon: Image.asset('images/pesquisa.png'),
                  iconSize: 100,
                  onPressed: () => _modalPesquisar(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
//                    Container(
//                      height: 40,
//                      width: 87,
//                      decoration: BoxDecoration(
//                          gradient: LinearGradient(
//                            begin: Alignment.topLeft,
//                            end: Alignment.topRight,
//                            stops: [0.3, 1],
//                            colors: [
//                              Colors.white,
//                              Colors.white,
//                            ],
//                          ),
//                          borderRadius: BorderRadius.all(Radius.circular(5))),
//                      child: FlatButton(
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (BuildContext context) => Login()));
//                        },
//                        child: Text("logar",
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 18,
//                            )),
//                      ),
//                    ),
                    Container(
                      height: 40,
                      width: 95,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            stops: [0.3, 1],
                            colors: [
                              Colors.white,
                              Colors.amber,
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Postar()));
                        },
                        child: Text("Postar",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 12,
            child: Container(
              child: FutureBuilder(
                  future: servicePostagem.getPostagens(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                enviaId(snapshot.data[index].id_postagem),
                            child: Container(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(snapshot.data[index].titulo),
                                    subtitle:
                                    Text(snapshot.data[index].descricao),
                                  ),
                                  Image.network(
                                      "http://192.168.100.35:3000/uploads//" +
                                          snapshot.data[index].postagem_imagem),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container(
                        child: Text("Carregando..."),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _modalPesquisar() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 40,
                color: Color(0xffa56336),
                child: Text(
                  "Pesquisa",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
              ),
              new DropdownButton(
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 42,
                value: selectTipoModal,
                items: listTipoOcorrenciaModal,
                hint: Text("Tipo ocorrência"),
                onChanged: (value) {
                  selectTipoModal = value;
                  setState(() {});
                },
                style: Theme.of(context).textTheme.title,
              ),
              new DropdownButton(
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 42,
                value: selectEspecieModal,
                items: listEspecieModal,
                hint: Text(
                  "Espécie",
                  textAlign: TextAlign.center,
                ),
                onChanged: (value) {
                  selectEspecieModal = value;
                  setState(() {});
                },
                style: Theme.of(context).textTheme.title,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Título do post",
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
              Container(
                height: 40,
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
                            builder: (BuildContext context) => Postar()));
                  },
                  child: Text("Pesquisar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ),
            ],
          );
        });
  }

  void loadTipo() {
    listTipoOcorrenciaModal = [];
    listTipoOcorrenciaModal.add(DropdownMenuItem(
      child: Text('Animal desaparecido'),
      value: "desaparecido",
    ));
    listTipoOcorrenciaModal.add(new DropdownMenuItem(
      child: Text('Adoção'),
      value: "Adoção",
    ));
    listTipoOcorrenciaModal.add(new DropdownMenuItem(
      child: Text('perdido'),
      value: "perdido",
    ));
  }

  void loadEspecie() {
    listEspecieModal = [];
    listEspecieModal.add(DropdownMenuItem(
      child: Text('Cachorro'),
      value: "Cachorro",
    ));
    listEspecieModal.add(new DropdownMenuItem(
      child: Text('Gato'),
      value: "Gato",
    ));
    listEspecieModal.add(new DropdownMenuItem(
      child: Text('Outros'),
      value: "Outros",
    ));
  }

  void enviaId(int idpost) {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => TelaPost(idpost)));
    });
  }
}
