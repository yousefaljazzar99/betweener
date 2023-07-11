class User {

  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final int isActive;
  final String? country;
  final String? ip;
  final String? long;
  final String? lat;
  final String? fcm;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    this.country,
    this.ip,
    this.long,
    this.lat,
    this.fcm,

  final String name;
  final String email;
  final String updatedAt;
  final String createdAt;
  final int id;

  User({
    required this.name,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['isActive'],
      country: json['country'],
      ip: json['ip'],
      long: json['long'],
      lat: json['lat'],
      fcm: json['fcm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'isActive': isActive,
      'country': country,
      'ip': ip,
      'long': long,
      'lat': lat,
      'fcm': fcm,
    };
  }

      name: json['name'],
      email: json['email'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }
}
