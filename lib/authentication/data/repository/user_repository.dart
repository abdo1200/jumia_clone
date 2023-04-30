import 'package:dartz/dartz.dart';
import 'package:jumia_clone/authentication/data/datasource/user_remote_datasource.dart';
import 'package:jumia_clone/authentication/domain/entities/user.dart';
import 'package:jumia_clone/authentication/domain/usecases/email_login_usecase.dart';
import 'package:jumia_clone/authentication/domain/usecases/sign_up_usecase.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/repository/base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final BaseUserRemoteDataSource baseUseremoteDataSource;

  UserRepository(this.baseUseremoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> completeData() async {
    // TODO: implement emailLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> emailLogin(
      EmailLoginParameters parameters) async {
    final result = await baseUseremoteDataSource.emailLogin(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> facebookLogin() async {
    final result = await baseUseremoteDataSource.facebookLogin();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
      SignUpParameters parameters) async {
    final result = await baseUseremoteDataSource.signUp(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> checkAuth() async {
    final result = await baseUseremoteDataSource.checkAuth();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
