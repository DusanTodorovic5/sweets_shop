class User {
  final String username;
  final String password;
  final String category;
  final String email;
  final String name;
  final String surname;
  final String address;

  User({
    required this.username,
    required this.password,
    required this.category,
    required this.email,
    required this.name,
    required this.surname,
    required this.address,
  });

  bool canLogin(String password) => password == this.password;

  bool get isAdmin => category == "admin";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      category: json['category'],
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      address: json['address'],
    );
  }

  User copy() => User(
        username: username,
        password: password,
        category: category,
        email: email,
        name: name,
        surname: surname,
        address: address,
      );

  static User get empty => User(
        username: "None",
        password: "none",
        category: "none",
        email: "none",
        name: "none",
        surname: "none",
        address: "none",
      );
}
