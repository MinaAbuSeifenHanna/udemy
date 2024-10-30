import 'package:appwithcleanarch/feature/auth/domain/entity/user_entity.dart';
import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository ;
  RegisterUseCase(this.repository);
  Future<UserEntity> call(String email , String password)=> repository.register(
      email, password);
}