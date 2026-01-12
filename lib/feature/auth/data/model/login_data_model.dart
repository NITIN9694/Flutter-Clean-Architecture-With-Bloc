
import 'package:clean_architure/feature/auth/domain/enitites/user.dart';

class AuthModel extends UserAuth{
  AuthModel({
    required super.id,
    required super.title,
    required super.body,
});


  factory AuthModel.fromJson(Map<String, dynamic> json) {
 return AuthModel(id: json["id"], title: json["title"]??"", body: json["body"]??"");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['id'] = this.id;
    return data;
  }
}
