class AppUser {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        photoUrl: json["photoUrl"],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
      };
}
