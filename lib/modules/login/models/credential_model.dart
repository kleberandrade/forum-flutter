import 'package:equatable/equatable.dart';

class CredentialModel extends Equatable {
  final String email;
  final String password;

  CredentialModel({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
