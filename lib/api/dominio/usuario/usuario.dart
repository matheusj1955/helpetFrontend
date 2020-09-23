class Usuario{
  int id_usuario;
  String nome;
  String tel;
  String email;

  Usuario(this.id_usuario,this.nome,this.tel,this.email);

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
        json['id_usuario'],
        json['nome'],
        json['tel'],
        json['email']
    );
  }
}