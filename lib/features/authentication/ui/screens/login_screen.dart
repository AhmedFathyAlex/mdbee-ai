import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdbee_ai/core/resources/app_assets.dart';
import 'package:mdbee_ai/core/resources/app_colors.dart';
import 'package:mdbee_ai/core/service/remote/service_locator.dart';
import 'package:mdbee_ai/core/utils/app_sized_box.dart';
import 'package:mdbee_ai/core/widgets/app_button.dart';
import 'package:mdbee_ai/core/widgets/custom_text_field.dart';
import 'package:mdbee_ai/features/authentication/blocs/auth_cubit.dart';
import 'package:mdbee_ai/features/authentication/blocs/auth_states.dart';
import 'package:mdbee_ai/features/authentication/ui/widgets/or_divider.dart';
import 'package:mdbee_ai/features/authentication/ui/widgets/social_media_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: ServiceLocator.instance<AuthenticationCubit>(),
      listener: (context, state) {
       if(state is AuthenticationSuccess){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success'),
        backgroundColor: Colors.green,));
       }
       if(state is AuthenticationFailure){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failure'),
        backgroundColor: Colors.red,));
       }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      20.ph,
                      Image.asset(AppAssets.appLogo),
                      Divider(
                        color: AppColors.lightGrey,
                        height: 15,
                      ),
                      30.ph,
                      CustomTextFormField(
                          controller: _emailController, hintText: 'Email'),
                      15.ph,
                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: 'password',
                        isPassword: true,
                      ),
                      15.ph,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      20.ph,
                     AppButton(btnTitle: 
                      state is AuthenticationLoading ? 'Loading' : 'Login',
                      onPressed: () {
                        ServiceLocator.instance<AuthenticationCubit>().loginWithEmail(
                        email: _emailController.text,
                         password: _passwordController.text);
                      },),
                      15.ph,
                      const OrDivider(),
                      15.ph,
                      SocialMediaButton(
                          image: AppAssets.googleIcon,
                          btnTitle: 'Continue with Google'),
                      10.ph,
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        width: 350.w, // Adjust the width as needed
                        child: const Text(
                          'If you continue with Google and don\'t already have an MDBee account, you are creating an account and you agree to our Terms of Use, Privacy Notice, including use for marketing purposes.',
                          softWrap:
                              true, // Allows text to wrap to the next line
                          textAlign:
                              TextAlign.center, // Adjust alignment as needed
                          style: TextStyle(
                            fontSize: 16.0, // Adjust the font size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
