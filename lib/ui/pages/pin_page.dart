import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class PinPage extends StatelessWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Input PIN',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 72),
            SizedBox(
              width: 200,
              child: TextFormField(
                obscureText: true,
                cursorColor: greyColor,
                obscuringCharacter: '*',
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                  letterSpacing: 16,
                ),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
