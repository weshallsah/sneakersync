class UserModel {
  UserModel({
    required this.email,
    required this.fullname,
    required this.phone,
    required this.username,
    required this.id,
  });
  late final String id;
  late final String username;
  late final String fullname;
  late final String email;
  late final int phone;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    print(json['id']);
    id = json['id'];
    // print(json['username']);
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['id'] = id;
    _data['fullname'] = fullname;
    _data['email'] = email;
    _data['phone'] = phone;
    return _data;
  }
}
