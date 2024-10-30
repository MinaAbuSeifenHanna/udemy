import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';
import 'package:appwithcleanarch/feature/auth/presention/view/widgets/body_register.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key , required this.repository});
  final AuthRepository repository ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BodyRegisterScreen(repository: repository)),
    );
  }
}
