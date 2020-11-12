class Usuario{
  int id_usuario;
  String nome;
  String tel;
  String email;
  String senha;

  Usuario(this.id_usuario,this.nome,this.tel,this.email,this.senha);

  Usuario.verificaLogin(String loginEmail, String loginSenha) {
    this.email = loginEmail;
    this.senha = loginSenha;
  }

  factory Usuario.fromJson(Map<String, dynamic> json){
    return Usuario(
        json['id_usuario'],
        json['nome'],
        json['tel'],
        json['email'],
        json['senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "tel": tel,
      "email": email,
      "senha": senha
    };
  }

  Map<String, dynamic> toMap_login() {
    return {
      "email": email,
      "senha": senha
    };
  }


}