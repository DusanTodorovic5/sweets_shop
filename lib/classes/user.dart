class User {
  final String username;
  final String password;
  final String category;

  User({
    required this.username,
    required this.password,
    required this.category,
  });

  bool canLogin(String password) => password == this.password;

  bool get isAdmin => category == "admin";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      category: json['category'],
    );
  }
}
