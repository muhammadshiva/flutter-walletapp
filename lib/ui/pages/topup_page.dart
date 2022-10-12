import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/topup_item.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                'Wallet',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/img_wallet.png',
                    width: 80,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8008 2208 1996',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Shayana Hanna',
                        style: greyTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Select Bank',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              TopupItem(
                imageUrl: 'assets/img_bank_bca.png',
                title: 'BANK BCA',
                time: '50 mins',
                onTap: () {},
                isSelected: true,
              ),
              TopupItem(
                imageUrl: 'assets/img_bank_bni.png',
                title: 'BANK BNI',
                time: '50 mins',
                onTap: () {},
              ),
              TopupItem(
                imageUrl: 'assets/img_bank_mandiri.png',
                title: 'BANK Mandiri',
                time: '50 mins',
                onTap: () {},
              ),
              TopupItem(
                imageUrl: 'assets/img_bank_ocbc.png',
                title: 'BANK OCBC',
                time: '50 mins',
                onTap: () {},
              ),
              const SizedBox(height: 30),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/topup-amount');
                },
              ),
              const SizedBox(height: 57),
            ],
          ),
        ],
      ),
    );
  }
}
