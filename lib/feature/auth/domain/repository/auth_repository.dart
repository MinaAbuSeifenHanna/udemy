import 'package:appwithcleanarch/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepository{

  Future<UserEntity> login(String email , String password);
  Future<UserEntity> register(String email , String password);

  Future<void> logout();
}