// import 'package:equatable/equatable.dart';
// import 'package:jumia_clone/authentication/domain/entities/user.dart';

// import '../../../core/error/failure.dart';
// import 'package:dartz/dartz.dart';
// import '../../../core/usecase/base_usecase.dart';
// import '../repository/base_user_repository.dart';

// class EmailLoginUseCase extends BaseUseCase<UserEntity, EmailLoginParameters> {
//   final BaseUserRepository baseUserRepository;
//   EmailLoginUseCase(this.baseUserRepository);
//   @override
//   Future<Either<Failure, UserEntity>> call(
//       EmailLoginParameters parameters) async {
//     return await baseUserRepository.emailLogin(parameters);
//   }
// }

// class EmailLoginParameters extends Equatable {
//   final String email;
//   final String password;

//   const EmailLoginParameters(
//     this.email,
//     this.password,
//   );

//   @override
//   List<Object> get props => [email, password];
// }
