part of 'add_money_plan_bloc.dart';

abstract class AddMoneyPlanState extends Equatable {
  const AddMoneyPlanState();

  @override
  List<Object> get props => [];
}

class AddMoneyPlanInitial extends AddMoneyPlanState {}

class AddMoneyPlanLoading extends AddMoneyPlanState {}

class AddMoneyPlanFailed extends AddMoneyPlanState {
  final String e;
  const AddMoneyPlanFailed(this.e);

  @override
  List<Object> get props => [e];
}

class AddMoneyPlanSuccess extends AddMoneyPlanState {}
