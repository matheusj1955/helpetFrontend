class LoginUsuario{
  String email;
  String senha;

  LoginUsuario(this.email, this.senha);

  factory LoginUsuario.fromJson(Map<String, dynamic> json){
    return LoginUsuario(
      json['email'],
      json['senha'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "senha": senha
    };
  }

  String getToken(Map<String, dynamic> json){
    return json["token"];
  }

}