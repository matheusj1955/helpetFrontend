class Usuario{
  int id_usuario;
  String nome;
  String telefone;
  String email;

  Usuario(this.id_usuario,this.nome,this.telefone,this.email);

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
        json['id_usuario'],
        json['nome'],
        json['telefone'],
        json['email']
    );
  }
}