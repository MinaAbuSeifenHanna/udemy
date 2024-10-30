import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';
import 'package:appwithcleanarch/feature/auth/presention/manager/auth_cubit.dart';
import 'package:appwithcleanarch/feature/auth/presention/view/widgets/body_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, required this.repository});

  final AuthRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(child: BodyLoginScreen(repository: repository,)),
        );
      },
    );
  }
}
