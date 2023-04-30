import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String displayName;
  final String email;
  final String profilePic;
  final String phone;

  const UserEntity({
    this.id = '',
    this.displayName = '',
    this.email = '',
    this.profilePic = '',
    this.phone = '',
  });

  UserEntity copyWith({
    String? id,
    String? displayName,
    String? email,
    String? profilePic,
    String? phone,
  }) {
    return UserEntity(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [displayName, email, profilePic, phone];
}
