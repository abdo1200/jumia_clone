import 'package:jumia_clone/authentication/domain/entities/user.dart';
import '../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/base_user_repository.dart';

class FacebookLoginUseCase extends BaseUseCase<UserEntity, NoParameters> {
  final BaseUserRepository baseUserRepository;
  FacebookLoginUseCase(this.baseUserRepository);
  @override
  Future<Either<Failure, UserEntity>> call(NoParameters parameters) async {
    return await baseUserRepository.facebookLogin();
  }
}
