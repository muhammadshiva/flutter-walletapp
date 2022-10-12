import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  const HomeLatestTransactionItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.time,
    required this.value,
  }) : super(key: key);

  final String iconUrl;
  final String title;
  final String time;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
