import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: blueTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        unselectedLabelStyle: blackTextStyle.copyWith(
          fontSize: 10,
          fontWeight: medium,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_overview.png',
              width: 20,
              height: 20,
              color: blueColor,
            ),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_history.png',
              width: 20,
              height: 20,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_statistic.png',
              width: 20,
              height: 20,
            ),
            label: 'Statistic',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_reward.png',
              width: 20,
              height: 20,
            ),
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}
