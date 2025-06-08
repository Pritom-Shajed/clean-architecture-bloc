import 'package:auth/src/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.username});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      username: map['username'] as String,
    );
  }
}
