import 'package:equatable/equatable.dart';
import 'package:jumia_clone/authentication/domain/entities/user.dart';

import '../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/base_user_repository.dart';

class SignUpUseCase extends BaseUseCase<UserEntity, SignUpParameters> {
  final BaseUserRepository baseUserRepository;
  SignUpUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, UserEntity>> call(SignUpParameters parameters) async {
    return await baseUserRepository.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String email;
  final String password;
  final String displayName;

  const SignUpParameters(this.email, this.password, this.displayName);

  @override
  List<Object> get props => [email, password, displayName];
}
