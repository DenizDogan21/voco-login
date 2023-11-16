
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['first_name'] + ' ' + json['last_name'], // Varsayılan olarak ad ve soyad birleştirildi
      email: json['email'],
    );
  }
}
