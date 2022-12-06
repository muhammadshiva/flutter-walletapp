part of 'fetch_money_plan_bloc.dart';

abstract class FetchMoneyPlanState extends Equatable {
  const FetchMoneyPlanState();

  @override
  List<Object> get props => [];
}

class FetchMoneyPlanInitial extends FetchMoneyPlanState {}

class FetchMoneyPlanLoading extends FetchMoneyPlanState {}

class FetchMoneyPlanFailed extends FetchMoneyPlanState {
  final String e;
  const FetchMoneyPlanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class FetchMoneyPlanSuccess extends FetchMoneyPlanState {
  final List<MoneyPlanModel> moneyplans;
  const FetchMoneyPlanSuccess(this.moneyplans);

  @override
  List<Object> get props => [moneyplans];
}
