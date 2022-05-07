import 'package:fitness_app/presentation/authorization/login_page.dart';
import 'package:fitness_app/presentation/design/colors.dart';
import 'package:fitness_app/presentation/design/common/interactive_widget.dart';
import 'package:fitness_app/presentation/design/solid_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _bg(),
          _gradient(),
          Align(
            child: _body(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buttons(),
          ),
        ],
      ),
    );
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/logo.svg'),
            const SizedBox(height: 30),
            Text(
              'Shape Your Body',
              style: GoogleFonts.sourceSansPro(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Boost your knowledge on the blog. Find your fit with wear and gear.',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                color: CustomColors.textGray,
              ),
            ),
          ],
        ),
      );

  Widget _buttons() => Padding(
        padding: const EdgeInsets.only(bottom: 40, right: 24, left: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SolidButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
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
                    // push to Register flow
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
      );

  Widget _bg() => Image.asset(
        'assets/images/auth_bg.png',
        fit: BoxFit.cover,
      );

  Widget _gradient() => Container(
        color: CustomColors.darkBackground.withOpacity(0.85),
      );
}
