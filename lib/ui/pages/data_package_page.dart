import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/package_item.dart';

import '../widgets/forms.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
          ),
          const SizedBox(height: 40),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: const [
              PackageItem(
                amount: 10,
                price: 218000,
              ),
              PackageItem(
                amount: 25,
                price: 420000,
                isSelected: true,
              ),
              PackageItem(
                amount: 40,
                price: 2500000,
              ),
              PackageItem(
                amount: 99,
                price: 5000000,
              ),
            ],
          ),
          const SizedBox(height: 85),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {},
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
