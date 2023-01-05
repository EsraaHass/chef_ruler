import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  static const String routeName = 'MyUser';
  final String id;
  final String password;
  final String email;
  final String imageUrl;
  final String name;
  final String city;
  final bool gender;

  const MyUser({
    required this.id,
    required this.password,
    required this.email,
    required this.imageUrl,
    required this.name,
    this.city = 'Egypt',
    this.gender = true,
  });

  factory MyUser.fromFireStore(Map<String, dynamic> fromFirestore) => MyUser(
    id: fromFirestore['id'],
        password: fromFirestore['password'],
        email: fromFirestore['email'],
        imageUrl: fromFirestore['image_url'],
        name: fromFirestore['name'],
        city: fromFirestore['city'],
        gender: fromFirestore['gender'],
      );

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'image_url': imageUrl,
      'name': name,
      'city': city,
      'gender': gender
    };
  }

  @override
  List<Object?> get props =>
      [id, password, email, imageUrl, name, city, gender];
}
