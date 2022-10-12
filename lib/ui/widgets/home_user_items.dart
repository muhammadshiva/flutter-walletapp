import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  const HomeUserItem({
    Key? key,
    required this.imageUrl,
    required this.username,
  }) : super(key: key);

  final String imageUrl;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(
              bottom: 13,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Text(
            '@$username',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
