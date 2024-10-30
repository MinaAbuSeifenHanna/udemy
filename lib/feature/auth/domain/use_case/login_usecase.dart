import 'package:appwithcleanarch/feature/auth/domain/entity/user_entity.dart';
import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository ;
  LoginUseCase({required this.repository});
  Future<UserEntity> call(String email , String password) =>  repository.login(email, password);
}