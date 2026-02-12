class UserModel {
  UserModel({this.password, this.userName, this.email, this.id});
  UserModel.fromjson(Map<String, dynamic> json) {
    password = json['password'];
    userName = json['user_name'];
    email = json['email'];
    id = json['id'];
  }
  static String collection = "Users";
  String? password;
  String? userName;
  String? email;
  String? id;

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'user_name': userName,
      'email': email,
      'id': id,
    };
  }
}
