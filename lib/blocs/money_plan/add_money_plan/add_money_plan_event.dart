part of 'add_money_plan_bloc.dart';

abstract class AddMoneyPlanEvent extends Equatable {
  const AddMoneyPlanEvent();

  @override
  List<Object> get props => [];
}

class AddMoneyPlanPost extends AddMoneyPlanEvent {
  final MoneyPlanFormModel data;

  const AddMoneyPlanPost(this.data);

  @override
  List<Object> get props => [data];
}
