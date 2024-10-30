import 'package:appwithcleanarch/feature/auth/domain/entity/user_entity.dart';
import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context)=>BlocProvider.of(context);
  AuthCubit(this.repository) : super(AuthInitial());
  final AuthRepository repository ;

  Future<void> userLogin(String email , String password)
  async
  {

    emit(AuthLoadingState());
     await repository.login(email, password)
          .then((value)
     {
       emit(AuthLoginSuccessState(value.id));
     }).catchError((error){
       emit(AuthLoginFailState(error));
     });

  }
  Future<void> userRegister(String email , String password)
  async
  {

    emit(AuthLoadingState());
    await repository.register(email, password)
        .then((value)
    {
      emit(AuthRegisterSuccessState(value.id));
    }).catchError((error){
      emit(AuthRegisterFailState(error));
    });

  }
}
