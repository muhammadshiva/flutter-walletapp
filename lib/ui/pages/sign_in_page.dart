import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneywise_app/shared/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // NOTE: PASSWORD INPUT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ],
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 24,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  'Create New Account',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
