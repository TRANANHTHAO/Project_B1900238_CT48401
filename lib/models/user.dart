class User {
  final String name;
  final double phone;
  final String mail;
  final String imageUrl;
  final String address;

  User({
    required this.name,
    required this.phone,
    required this.mail,
    required this.imageUrl,
    required this.address,
  });

  User copyWith(
      {String? name,
      double? phone,
      String? mail,
      String? imageUrl,
      String? address}) {
    return User(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      mail: mail ?? this.mail,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
