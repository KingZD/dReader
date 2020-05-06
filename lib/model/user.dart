import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String userName;
  String avatar;
  String sex;
  String token;

  User(this.userName, this.avatar, this.sex, this.token);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.empty();

  bool isLogin(){
    return token != null;
  }
}
