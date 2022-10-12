import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class TopupItem extends StatelessWidget {
  const TopupItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String time;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 96),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
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
          ],
        ),
      ),
    );
  }
}
