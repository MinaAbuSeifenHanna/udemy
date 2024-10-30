import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';
import 'package:appwithcleanarch/feature/auth/presention/manager/auth_cubit.dart';
import 'package:appwithcleanarch/feature/auth/presention/view/widgets/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key, required this.repository});

  final AuthRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repository),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return RegisterScreen(repository: repository,);
        },
      ),
    );
  }
}
