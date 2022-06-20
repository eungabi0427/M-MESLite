class Users {
  final String? id;
  final String? password;

  Users({this.id, this.password});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['ID'] as String,
      password: json['Name'] as String,
    );
  }

  @override
  String toString() {
    print('Users | Users{name: $id, email: $password}');
    return 'Users{ID: $id, Name: $password}';
  }
}
