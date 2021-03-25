import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/dominio/postagens/service_postagem.dart';

class TelaPost extends StatefulWidget {

  int idtelapostagens;
  TelaPost(this.idtelapostagens);

  @override
  _TelaPostState createState() => _TelaPostState();
}

ServicePostagem servicePostagem = ServicePostagem();

class _TelaPostState extends State<TelaPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Postagem"),
        centerTitle: true,
        backgroundColor: Color(0xffa56336),
      ),
      body: Container(
        child: FutureBuilder(
            future: servicePostagem.getUmaPostagem(widget.idtelapostagens),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data[widget.idtelapostagens].titulo),
                            subtitle:
                            Text(snapshot.data[widget.idtelapostagens].descricao),
                          ),
                          Image.network(
                              "http://192.168.100.35:3000/uploads//" +
                                  snapshot.data[widget.idtelapostagens].postagem_imagem),
                        ],
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
    );
  }
}
//        child: Text("${widget.idtelapostagens}")