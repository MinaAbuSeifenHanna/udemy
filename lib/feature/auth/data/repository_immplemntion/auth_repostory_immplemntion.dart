import 'package:appwithcleanarch/feature/auth/data/datasourse.dart';
import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';

import '../../domain/entity/user_entity.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  AuthRepositoryImpl({required this.firebaseAuthDataSource});

  @override
  Future<UserEntity> login(String email, String password) async {
     final user = await firebaseAuthDataSource.signInWithEmailAndPassword(email, password);
     return UserEntity(id: user.uid, email: user.email!, name: '');


  }
   @override
  Future<UserEntity> register(String email, String password)async {
   final user = await firebaseAuthDataSource.createUserWithEmailAndPassword(email, password);
   return UserEntity(id: user.uid, email: user.email!, name: '');
  }
  @override
  Future<void> logout()  async {

    await firebaseAuthDataSource.signOut();
  }

}