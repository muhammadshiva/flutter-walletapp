part of 'money_plan_categories_bloc.dart';

abstract class MoneyPlanCategoriesEvent extends Equatable {
  const MoneyPlanCategoriesEvent();

  @override
  List<Object> get props => [];
}

class MoneyPlanCategoriesGet extends MoneyPlanCategoriesEvent {}
