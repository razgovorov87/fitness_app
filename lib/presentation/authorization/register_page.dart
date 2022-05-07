import 'package:fitness_app/presentation/authorization/get_info_flow/get_info_flow.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/solid_button.dart';
import 'package:fitness_app/presentation/design/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dateOfBirthdayController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.darkBackground,
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create an account',
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 30),
              _form(),
              const SizedBox(height: 30),
              SolidButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GetInfoFlow(),
                    ),
                  );
                },
                child: Text(
                  'Sign up'.toUpperCase(),
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By clicking Sign up you agree to the following ',
                  style: GoogleFonts.sourceSansPro(
                    color: CustomColors.textGray,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: GoogleFonts.sourceSansPro(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //push to Terms and Conditions page
                        },
                    ),
                    const TextSpan(text: ' without reservation'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _form() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: _usernameController,
            hintText: 'Username',
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _dateOfBirthdayController,
            hintText: 'Date of birthday',
          ),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            obscureText: true,
            autocorrect: false,
          ),
          const SizedBox(height: 8),
        ],
      );

  PreferredSizeWidget _appBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        splashRadius: 18,
        icon: const Icon(
          FontAwesome5.arrow_left,
          size: 16,
        ),
      ));
}
