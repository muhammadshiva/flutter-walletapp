import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class DataProviderItem extends StatelessWidget {
  const DataProviderItem({
    Key? key,
    required this.name,
    required this.imageUrl,
    this.isSelected = false,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 2),
              Text(
                'Available',
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
