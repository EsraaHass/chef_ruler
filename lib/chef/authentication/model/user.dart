import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  static const String routeName = 'MyUser';
  final String id;
  final String phoneNumber;
  final int password;
  final String name;
  final String city;
  final bool gender;

  const MyUser({
    required this.id,
    required this.phoneNumber,
    required this.password,
    required this.name,
    this.city = 'Egypt',
    this.gender = true,
  });

  factory MyUser.fromFireStore(Map<String, dynamic> fromFirestore) => MyUser(
        id: fromFirestore['id'],
        phoneNumber: fromFirestore['phone_number'],
        password: fromFirestore['password'],
        name: fromFirestore['name'],
        city: fromFirestore['city'],
        gender: fromFirestore['gender'],
      );

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'password': password,
      'name': name,
      'city': city,
      'gender': gender
    };
  }

  @override
  List<Object?> get props => [id, phoneNumber, password, name, city, gender];
}
