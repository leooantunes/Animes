class User {
  String email;
  String name;
  String password;
  String token;

  User.login(Map<String, dynamic> map) {
    this.email = map["email"];
    this.password = map["password"];
  }

  User.cadastro(Map<String, dynamic> map){
    this.email = map["email"];
    this.name = map["name"];
    this.password = map["password"];
  }

  User.forgot(Map<String, dynamic> map){
    this.email = map["email"];
  }

  User.reset(Map<String, dynamic> map){
    this.email = map["email"];
    this.password = map["password"];
    this.token = map["token"];
  }

}