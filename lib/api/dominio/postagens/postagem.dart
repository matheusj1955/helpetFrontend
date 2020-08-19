class Postagem {

  int id_postagem;
  int usuario;
  String titulo;
  String descricao;
//  String post_imagem;


  //alt+insert
  Postagem(this.id_postagem, this.usuario, this.titulo, this.descricao);

  factory Postagem.fromJson(Map<String, dynamic> json){
    return Postagem(
      json['id_postagem'],
      json['id_usuario'],
      json['titulo'],
      json['descricao']
    );
  }
}