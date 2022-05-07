import 'package:fitness_app/presentation/authorization/register_page.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/solid_button.dart';
import 'package:fitness_app/presentation/design/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../design/common/interactive_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _bg(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: CustomColors.darkBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back',
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                ),
              ),
              Text(
                'Login to your account',
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  color: CustomColors.textGray,
                ),
              ),
              const SizedBox(height: 35),
              _form(),
              const SizedBox(height: 35),
              SolidButton(
                onTap: () {
                  // push to Login flow
                },
                child: Text(
                  'Login'.toUpperCase(),
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomInteractiveWidget(
                onTap: () {},
                child: Text(
                  'Forgot your password?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.sourceSansPro(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 4),
                  CustomInteractiveWidget(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.sourceSansPro(
                        color: CustomColors.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _form() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: _nameController,
            hintText: 'Name',
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
            autocorrect: false,
          ),
        ],
      );

  Widget _bg() => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/login_bg.png',
            ).image,
          ),
        ),
      );
}
