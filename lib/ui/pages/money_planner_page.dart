import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneywise_app/models/money_plan_model.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';

import 'package:moneywise_app/ui/widgets/money_planner_item.dart';
import 'package:moneywise_app/ui/widgets/money_planner_categories_item.dart';

import '../../blocs/money_plan/fetch_money_plan/fetch_money_plan_bloc.dart';

class MoneyPlannerPage extends StatefulWidget {
  const MoneyPlannerPage({Key? key}) : super(key: key);

  @override
  State<MoneyPlannerPage> createState() => _MoneyPlannerPageState();
}

class _MoneyPlannerPageState extends State<MoneyPlannerPage> {
  // late MoneyPlanCubit _moneyPlanCubit;

  @override
  void initState() {
    // _moneyPlanCubit = MoneyPlanCubit()..load();
    super.initState();
  }

  @override
  void dispose() {
    // _moneyPlanCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rencana Keuangan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Total Rencana Keuangan',
              //   style: blackTextStyle.copyWith(
              //     fontWeight: medium,
              //   ),
              // ),
              // const SizedBox(
              //   height: 2,
              // ),
              // Text(
              //   'Rp 0',
              //   style: blackTextStyle.copyWith(
              //     fontWeight: semiBold,
              //   ),
              // ),
              // const SizedBox(height: 17),
              // const Divider(),
              const SizedBox(height: 17),
              SizedBox(
                height: 395,
                child: BlocProvider(
                  create: (context) =>
                      FetchMoneyPlanBloc()..add(FetchMoneyPlanGet()),
                  child: BlocBuilder<FetchMoneyPlanBloc, FetchMoneyPlanState>(
                    builder: (context, state) {
                      if (state is FetchMoneyPlanSuccess) {
                        return state.moneyplans.isEmpty
                            ? Center(
                                child: Text(
                                  'Belum ada rencana keuanagan.',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: medium,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Scrollbar(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: state.moneyplans.map((moneyplan) {
                                      return MoneyPlannnerItem(
                                          moneyplan: moneyplan);
                                    }).toList(),
                                  ),
                                ),
                              );
                      }

                      if (state is FetchMoneyPlanFailed) {
                        return Text(state.e.toString());
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                      // return Column(
                      //   children: [
                      //     // MoneyPlannnerItem(
                      //     //   // imageUrl: 'assets/ic_bag.png',
                      //     //   title: 'Tas Wanita',
                      //     //   amount: 250000,
                      //     //   // total: 500000,
                      //     //   // percentage: 50,
                      //     //   value: 0.50,
                      //     // ),
                      //     // MoneyPlannnerItem(
                      //     //   // imageUrl: 'assets/ic_gadget.png',
                      //     //   title: 'Gadget',
                      //     //   amount: 250000,
                      //     //   // total: 500000,
                      //     //   // percentage: 60,
                      //     //   value: 0.40,
                      //     // ),
                      //     // MoneyPlannnerItem(
                      //     //   // imageUrl: 'assets/ic_saving.png',
                      //     //   title: 'Tabungan',
                      //     //   amount: 250000,
                      //     //   // total: 500000,
                      //     //   // percentage: 70,
                      //     //   value: 0.85,
                      //     // ),
                      //     // MoneyPlannnerItem(
                      //     //   // imageUrl: 'assets/ic_saving.png',
                      //     //   title: 'Tabungan',
                      //     //   amount: 250000,
                      //     //   // total: 500000,
                      //     //   // percentage: 70,
                      //     //   value: 0.85,
                      //     // ),
                      //   ],
                      // );
                    },
                  ),
                ),
                // Scrollbar(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: <Widget>[
                //         BlocBuilder<MoneyPlanCubit, MoneyPlanState>(
                //           builder: (context, state) {
                //             return state is MoneyPlanLoading
                //                 ? Center(
                //                     child: CircularProgressIndicator(),
                //                   )
                //                 : state is MoneyPlanFailed
                //                     ? Center(
                //                         child: ErrorFetch(
                //                           message: state.message,
                //                           onButtonPressed: () {
                //                             // _moneyPlanCubit.load();
                //                           },
                //                         ),
                //                       )
                //                     : state is FetchMoneyPlanSuccess
                //                         ? ListView.separated(
                //                             shrinkWrap: true,
                //                             separatorBuilder:
                //                                 ((context, index) =>
                //                                     Divider()),
                //                             itemCount:
                //                                 state.moneyplans.length,
                //                             itemBuilder: ((context, index) {
                //                               MoneyPlanModel data =
                //                                   state.moneyplans[index];
                //                               return ListTile(
                //                                 title: Text(data.name!),
                //                                 subtitle:
                //                                     Text('${data.amount}'),
                //                                 onTap: (() {}),
                //                               );
                //                             }),
                //                           )
                //                         : SizedBox.shrink();
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ),
              const SizedBox(height: 17),
              const Divider(),
            ],
          ),
          const SizedBox(height: 20),
          CustomFilledButton(
            title: 'Create Plan',
            onPressed: () {
              Navigator.pushNamed(context, '/money-planner-categories');
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
