import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/blocs/auth/auth_bloc.dart';
import 'package:moneywise_app/blocs/money_plan/add_money_plan/add_money_plan_bloc.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/models/money_plan_form_model.dart';
import 'package:moneywise_app/shared/shared_methods.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

class MoneyPlannerCreatePage extends StatefulWidget {
  final MoneyPlanCategoriesModel categoryId;

  const MoneyPlannerCreatePage({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  _MoneyPlannerCreatePageState createState() => _MoneyPlannerCreatePageState();
}

class _MoneyPlannerCreatePageState extends State<MoneyPlannerCreatePage> {
  final _formKey = GlobalKey<FormState>();
  // MoneyPlanFormModel? selectedMoneyCategory;

  final planController = TextEditingController(text: '');
  final amountController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Data Plan'),
      ),
      body: BlocProvider(
        create: (context) => AddMoneyPlanBloc(),
        child: BlocConsumer<AddMoneyPlanBloc, AddMoneyPlanState>(
          listener: (context, state) {
            if (state is AddMoneyPlanFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is AddMoneyPlanSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/data-success', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AddMoneyPlanLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 320,
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Kategori',
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.categoryId.name.toString(),
                            style: blackTextStyle.copyWith(fontWeight: bold),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Nama Plan',
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: planController,
                            decoration: InputDecoration(
                              hintStyle: greyTextStyle,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              contentPadding: const EdgeInsets.all(12),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Wajib diisi!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Target Amount',
                            style: blackTextStyle.copyWith(fontWeight: medium),
                          ),
                          const SizedBox(height: 5),

                          TextFormField(
                            controller: amountController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Wajib diisi!';
                              }
                              return null;
                            },
                          ),

                          // CustomFormField(
                          //   title: 'Target Amount',
                          //   controller: amountController,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        height: 50,
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => MoneyPlannerCreatePage(),
            //   ),
            // );
            debugPrint(widget.categoryId.id.toString());
            debugPrint(amountController.text.toString());
            debugPrint(planController.text.toString());

            if (_formKey.currentState!.validate()) {
              context.read<AddMoneyPlanBloc>().add(
                    AddMoneyPlanPost(
                      MoneyPlanFormModel(
                        categoryId: widget.categoryId.id.toString(),
                        amount: amountController.text.toString(),
                        name: planController.text.toString(),
                      ),
                    ),
                  );
            }

            Navigator.pushNamedAndRemoveUntil(
                context, '/money-planner-success', (route) => false);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
