import 'package:appwithcleanarch/core/utlis/app_color.dart';
import 'package:appwithcleanarch/core/utlis/app_strings.dart';
import 'package:appwithcleanarch/core/utlis/app_style.dart';
import 'package:appwithcleanarch/feature/auth/domain/repository/auth_repository.dart';
import 'package:appwithcleanarch/feature/auth/presention/manager/auth_cubit.dart';
import 'package:appwithcleanarch/feature/auth/presention/view/widgets/elevted_button_auth.dart';
import 'package:appwithcleanarch/feature/auth/presention/view/widgets/text_form_Field_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyRegisterScreen extends StatelessWidget {
  BodyRegisterScreen({super.key, required this.repository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
         if(state is AuthRegisterFailState)
           {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(content: Text('Fail create new user'),)
             );
           }
         if(state is AuthRegisterSuccessState)
         {
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text('Success create new user'),)
           );
         }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppStrings.welcome,
                    style: AppStyle.textStyle22,
                  ),
                  const SizedBox(height: 8,),
                  Text(AppStrings.enterEmailAndPassword,
                    style: AppStyle.textStyle18,
                  ),
                  const SizedBox(height: 10,),
                  TextFormFieldAuth(
                    labelText: AppStrings.email,
                    textController: emailController,
                    valid: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your email';
                      }
                      else
                      if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(
                          value)) {
                        return 'Please enter a valid email address';
                      }
                    },
                    prefix: const Icon(Icons.email_rounded),

                  ),
                  const SizedBox(height: 10,),
                  TextFormFieldAuth(
                    labelText: AppStrings.password,
                    textController: passwordController,
                    valid: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password';
                      }
                    },
                    prefix: const Icon(Icons.password_rounded),
                    obscure: true,
                    suffix: IconButton(
                        onPressed: () {}
                        , icon: Icon(Icons.remove_red_eye)
                    ),

                  ),
                  const SizedBox(height: 10,),
                  ElevatedButtonAuth(child: AppStrings.register,
                      tap: () {
                        AuthCubit.get(context).userRegister(
                            emailController.text, passwordController.text);
                        emailController.clear();
                        passwordController.clear();
                      }),
                  const SizedBox(height: 5,),
                  TextButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text(AppStrings.login))


                ],
              ),
            );
          }
        } );

  }
}
