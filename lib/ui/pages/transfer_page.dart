import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          const SizedBox(height: 40),
          Text(
            'Recent User',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
