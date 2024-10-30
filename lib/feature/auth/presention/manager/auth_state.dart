part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
 final class AuthLoadingState extends AuthState {}
final class AuthLoginSuccessState extends AuthState {
 final String uID ;
 AuthLoginSuccessState(this.uID);
}
final class AuthLoginFailState extends AuthState {
 final String error ;
 AuthLoginFailState(this.error);
}
final class AuthRegisterSuccessState extends AuthState {
 final String uID ;
 AuthRegisterSuccessState(this.uID);
}
final class AuthRegisterFailState extends AuthState {
 final String error ;
 AuthRegisterFailState(this.error);
}