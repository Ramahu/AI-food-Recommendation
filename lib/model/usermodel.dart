class LoginModel {
  String? message;
  String? token;
  UserModel? user;

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}

class RegisterModel {
  String? message;
  String? token;
  UserModel? user;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? gender;

  //String? birthdate;
  // String? password;
  // String? confirmPas;
  // String? image;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    //birthdate = json['birthdate'];
    // password = json['password'];
    // confirmPas = json['confirmPas'];
    // image = json['img'];
  }
}
