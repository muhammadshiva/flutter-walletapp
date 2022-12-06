part of 'fetch_money_plan_bloc.dart';

abstract class FetchMoneyPlanEvent extends Equatable {
  const FetchMoneyPlanEvent();

  @override
  List<Object> get props => [];
}

class FetchMoneyPlanGet extends FetchMoneyPlanEvent {}
