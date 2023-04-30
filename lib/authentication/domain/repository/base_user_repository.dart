import 'package:dartz/dartz.dart';
import 'package:jumia_clone/authentication/domain/entities/user.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';
import '../../../core/error/failure.dart';

abstract class BaseUserRepository {
  Future<Either<Failure, UserEntity>> facebookLogin();
  Future<Either<Failure, UserEntity>> emailLogin(
      EmailLoginParameters parameters);
  Future<Either<Failure, UserEntity>> completeData();
  Future<Either<Failure, UserEntity>> signUp(SignUpParameters parameters);
  Future<Either<Failure, UserEntity>> checkAuth();
}
