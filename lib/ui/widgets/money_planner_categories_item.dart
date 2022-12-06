import 'package:flutter/material.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/shared/shared_values.dart';

import '../../shared/theme.dart';

class MoneyPlannerCategoriesItem extends StatelessWidget {
  final MoneyPlanCategoriesModel moneyPlanCategories;

  const MoneyPlannerCategoriesItem({
    Key? key,
    required this.moneyPlanCategories,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: 327,
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: isSelected
            ? Border.all(
                color: blueColor,
                width: 2,
              )
            : null,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  baseImageUrl + moneyPlanCategories.thumbnail.toString(),
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            moneyPlanCategories.name.toString(),
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
