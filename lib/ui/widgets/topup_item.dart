import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class TopupItem extends StatelessWidget {
  const TopupItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.time,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String time;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
            border: Border.all(
              width: 2,
              color: isSelected ? blueColor : whiteColor,
            )),
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
