import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              height: 49,
              width: 191,
              margin: const EdgeInsets.only(
                top: 65,
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light_mw.png'),
                ),
              ),
            ),
            Text(
              'Sign in &\nGrow Your Finance',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: EMAIL INPUT
                  const CustomFormField(title: 'Email Address'),
                  const SizedBox(height: 16),
                  // NOTE: PASSWORD INPUT
                  const CustomFormField(
                    title: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: blueTextStyle,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomFilledButton(
                    title: 'Sign In',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            CustomTextButton(
              title: 'Create New Account',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-up', (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}
