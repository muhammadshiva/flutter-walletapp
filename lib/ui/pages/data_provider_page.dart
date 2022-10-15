import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/data_provider_item.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../shared/shared_methods.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Data'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
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
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14),
          const DataProviderItem(
            name: 'Telkomsel',
            imageUrl: 'assets/img_provider_telkomsel.png',
            isSelected: true,
          ),
          const DataProviderItem(
            name: 'Indosat',
            imageUrl: 'assets/img_provider_indosat.png',
          ),
          const DataProviderItem(
            name: 'Indosat',
            imageUrl: 'assets/img_provider_singtel.png',
          ),
          const SizedBox(height: 135),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
