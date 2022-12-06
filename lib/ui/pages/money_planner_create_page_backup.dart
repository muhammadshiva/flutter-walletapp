import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneywise_app/blocs/money_plan_categories/money_plan_categories_bloc.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/models/money_plan_form_model.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';
import 'package:moneywise_app/ui/widgets/money_planner_categories_item.dart';

import '../../blocs/money_plan/add_money_plan/add_money_plan_bloc.dart';
import '../../shared/theme.dart';

class MoneyPlannerCreatePageBackup extends StatefulWidget {
  const MoneyPlannerCreatePageBackup({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MoneyPlanFormModel data;

  @override
  State<MoneyPlannerCreatePageBackup> createState() =>
      _MoneyPlannerCreatePageBackupState();
}

class _MoneyPlannerCreatePageBackupState
    extends State<MoneyPlannerCreatePageBackup> {
  MoneyPlanCategoriesModel? selectedCategory;
  final idCategoryController = TextEditingController();
  final planController = TextEditingController(text: '');
  final amountController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    // amountController.addListener(() {
    //   final text = amountController.text;

    //   amountController.value = amountController.value.copyWith(
    //     text: NumberFormat.currency(
    //       locale: 'id',
    //       decimalDigits: 0,
    //       symbol: '',
    //     ).format(
    //       int.parse(
    //         text.replaceAll('.', ''),
    //       ),
    //     ),
    //   );
    // });
  }

  // addAmount() {
  //   if (amountController.text == '0') {
  //     amountController.text = '';
  //   }
  //   setState(() {
  //     amountController.text = amountController.text;
  //   });
  // }

  // deleteAmount() {
  //   if (amountController.text.isNotEmpty) {
  //     setState(() {
  //       amountController.text = amountController.text
  //           .substring(0, amountController.text.length - 1);
  //       if (amountController.text == '') {
  //         amountController.text = '0';
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Plan'),
      ),
      body: BlocProvider(
        create: (context) => AddMoneyPlanBloc(),
        child: BlocConsumer<AddMoneyPlanBloc, AddMoneyPlanState>(
          listener: (context, state) {
            if (state is AddMoneyPlanFailed) {
              showCustomSnackbar(context, state.e);
            }

            // if(state is AddMoneyPlanSuccess){
            //   context.read<MoneyPlanFormModel>().add()
            // }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 25),
                Text(
                  'Categories',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 14),
                BlocProvider(
                  create: (context) =>
                      MoneyPlanCategoriesBloc()..add(MoneyPlanCategoriesGet()),
                  child: BlocBuilder<MoneyPlanCategoriesBloc,
                      MoneyPlanCategoriesState>(
                    builder: (context, state) {
                      if (state is MoneyPlanCategoriesSuccess) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.moneyplans.map((moneyplan) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    [
                                      selectedCategory = moneyplan,
                                      idCategoryController.text =
                                          moneyplan.id.toString()
                                    ];
                                  });
                                },
                                child: MoneyPlannerCategoriesItem(
                                  moneyPlanCategories: moneyplan,
                                  isSelected:
                                      moneyplan.id == selectedCategory?.id,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 14),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        title: 'Plan Name',
                        controller: planController,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Target Amount',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                      TextFormField(
                        controller: amountController,
                        // amountController.text == '0'
                        //     ? addAmount()
                        //     : amountController.text.isNotEmpty
                        //         ? deleteAmount()
                        //         : null,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            child: Text(
                              'Rp ',
                              style: blackTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          hintStyle: greyTextStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                      // CustomFormField(
                      //   title: 'Target Amount',
                      //   controller: amountController,
                      // ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                selectedCategory != null &&
                        planController.text.isNotEmpty &&
                        amountController.text.isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              debugPrint(idCategoryController.text.toString());
                              debugPrint(planController.text.toString());
                              debugPrint(amountController.text.toString());
                              // context.read<AddMoneyPlanBloc>().add(
                              //       AddMoneyPlanPost(
                              //         widget.data.copyWith(
                              //           categoryId: idCategoryController.text
                              //               .toString(),
                              //           amount:
                              //               amountController.text.toString(),
                              //           name: planController.text.toString(),
                              //         ),
                              //       ),
                              //     );
                            },
                            child: Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
