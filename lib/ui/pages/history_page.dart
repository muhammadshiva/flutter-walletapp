import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/shared/shared_methods.dart';

import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/history_page.dart';

import 'package:moneywise_app/ui/widgets/home_latest_transactions_item.dart';

import '../../blocs/transaction/transaction_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: buildLatestTransactions(),
    );
  }
}

Widget buildLatestTransactions() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Latest Transactions',
        //   style: blackTextStyle.copyWith(
        //     fontWeight: semiBold,
        //     fontSize: 16,
        //   ),
        // ),
        Container(
          width: double.infinity,
          height: 600,
          margin: const EdgeInsets.only(top: 14),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: BlocProvider(
            create: (context) => TransactionBloc()..add(TransactionGet()),
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state is TransactionSuccess) {
                  return state.transactions.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada transaksi.',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Scrollbar(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                children: state.transactions.map((transaction) {
                              return HomeLatestTransactionItem(
                                  transaction: transaction);
                            }).toList()),
                          ),
                        );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}
