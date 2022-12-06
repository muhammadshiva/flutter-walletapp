import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneywise_app/blocs/money_plan_categories/money_plan_categories_bloc.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/models/money_plan_form_model.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/ui/pages/money_planner_create_page.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';
import 'package:moneywise_app/ui/widgets/money_planner_categories_item.dart';

import '../../blocs/money_plan/add_money_plan/add_money_plan_bloc.dart';
import '../../shared/theme.dart';

class MoneyPlannerCategoriesPage extends StatefulWidget {
  const MoneyPlannerCategoriesPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final MoneyPlanFormModel data;

  @override
  State<MoneyPlannerCategoriesPage> createState() =>
      _MoneyPlannerCategoriesPageState();
}

class _MoneyPlannerCategoriesPageState
    extends State<MoneyPlannerCategoriesPage> {
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
        title: const Text('Buat Plan Baru'),
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
                  'Kategori',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 40),
                BlocProvider(
                  create: (context) =>
                      MoneyPlanCategoriesBloc()..add(MoneyPlanCategoriesGet()),
                  child: BlocBuilder<MoneyPlanCategoriesBloc,
                      MoneyPlanCategoriesState>(
                    builder: (context, state) {
                      if (state is MoneyPlanCategoriesSuccess) {
                        return Column(
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
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 110),
                selectedCategory != null
                    ? SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoneyPlannerCreatePage(
                                  categoryId: selectedCategory!,
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16,
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
