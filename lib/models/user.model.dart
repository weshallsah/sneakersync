class UserModel {
  UserModel(
      {required this.email,
      required this.fullname,
      required this.password,
      required this.phone,
      required this.username});
  late final String username;
  late final String fullname;
  late final String email;
  late final String phone;
  late final String password;
  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    print(json['username']);
    fullname = json['fullname'];
    email = json['email'];
    print(json['phone']);
    phone = json['phone'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['fullname'] = fullname;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}
