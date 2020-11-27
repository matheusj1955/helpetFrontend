import 'dart:io';

class Postagem {

  int id_postagem;
  int id_usuario;
  String titulo;
  String descricao;
  File imagem;


  //alt+insert
  Postagem(this.id_postagem,this.titulo, this.descricao); //, this.post_imagem

  factory Postagem.fromJson(Map<String, dynamic> json){
    return Postagem(
      json['id_postagem'],
      json['titulo'],
      json['descricao'],
//      json['post_imagem'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "titulo": titulo,
      "descricao": descricao,
//      "postagem_imagem": post_imagem
    };
  }
}