import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moneywise_app/models/money_plan_model.dart';
import 'package:moneywise_app/shared/shared_values.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/pages/money_planner_edit_page.dart';

import '../../shared/shared_methods.dart';

class MoneyPlannnerItem extends StatelessWidget {
  final MoneyPlanModel moneyplan;

  const MoneyPlannnerItem({
    Key? key,
    required this.moneyplan,
    // required this.imageUrl,
    // required this.title,
    // required this.amount,
    // required this.total,
    // required this.percentage,
    // this.isSelected = false,
    // this.value = 0.0,
  }) : super(key: key);

  // final String imageUrl;
  // final String title;
  // final int amount;
  // final int percentage;
  // final int total;
  // final double value;
  // final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        // border: isSelected
        //     ? Border.all(
        //         width: 2,
        //         color: blueColor,
        //       )
        //     : null,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              icon: Icons.edit,
              backgroundColor: Colors.blue,
              onPressed: (BuildContext context) {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => MoneyPlannerEditPage(),
                    )));
              },
            ),
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: (BuildContext context) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(
                      'Hapus',
                      textAlign: TextAlign.center,
                    ),
                    content: const Text(
                      'Apakah anda ingin menghapus rencana keuangan ini?',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: SizedBox(
                              width: 120,
                              height: 95,
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 60,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Berhasil menghapus',
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  '/money-planner',
                                ),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                // AlertDialog(
                //   title: const Text('AlertDialog Title'),
                //   content: const Text('AlertDialog description'),
                //   actions: <Widget>[
                //     TextButton(
                //       onPressed: () => Navigator.pop(context, 'Cancel'),
                //       child: const Text('Cancel'),
                //     ),
                //     TextButton(
                //       onPressed: () => Navigator.pop(context, 'OK'),
                //       child: const Text('OK'),
                //     ),
                //   ],
                // );
              },
            ),
            // SlidableAction(onPressed: (BuildContext context) {})
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            children: [
              Image.network(
                baseImageUrl + moneyplan.thumbnail.toString(),
                height: 48,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moneyplan.name!,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // SizedBox(
                  //   width: 227,
                  //   height: 5,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(55),
                  //     child: LinearProgressIndicator(
                  //       value: value,
                  //       minHeight: 5,
                  //       valueColor: AlwaysStoppedAnimation(purpleColor),
                  //       backgroundColor: lightBgColor,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 20,
                    width: 227,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatCurrency(moneyplan.amount!),
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12,
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       '$percentage%',
                        //       style: greyTextStyle.copyWith(
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //     Text(
                        //       ' of Rp ${formatCurrency(total)}',
                        //       style: greyTextStyle.copyWith(
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
