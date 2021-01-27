class User {
  final String id;
  final String name;
  final String image;

  User(this.id, this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json["id"], json["name"], json["image"]);
  }
}
