import 'package:flutter/material.dart';
import 'package:testando/posts.dart';

class Postar extends StatefulWidget {
  @override
  _PostarState createState() => _PostarState();
}

class _PostarState extends State<Postar> {
  List<DropdownMenuItem<String>> listTipoOcorrencia = [];
  List<DropdownMenuItem<String>> listEspecie = [];
  String selectTipo = null;
  String selectEspecie = null;

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
      child: Text('Peixe'),
      value: "Peixe",
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadTipo();
    loadEspecie();
    return Scaffold(
      appBar: AppBar(
          title: Text("Postagem"),
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
                  icon: Image.asset('images/teste.png'),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Posts()));
                  },
                ),
                IconButton(
                  icon: Image.asset('images/teste.png'),
                  iconSize: 100,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Posts()));
                  },
                ),
              ],
            ),

            TextFormField(
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
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome do animal",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
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
}
