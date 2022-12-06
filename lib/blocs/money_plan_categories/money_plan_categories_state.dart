part of 'money_plan_categories_bloc.dart';

abstract class MoneyPlanCategoriesState extends Equatable {
  const MoneyPlanCategoriesState();

  @override
  List<Object> get props => [];
}

class MoneyPlanCategoriesInitial extends MoneyPlanCategoriesState {}

class MoneyPlanCategoriesLoading extends MoneyPlanCategoriesState {}

class MoneyPlanCategoriesFailed extends MoneyPlanCategoriesState {
  final String e;
  const MoneyPlanCategoriesFailed(this.e);

  @override
  List<Object> get props => [e];
}

class MoneyPlanCategoriesSuccess extends MoneyPlanCategoriesState {
  final List<MoneyPlanCategoriesModel> moneyplans;
  const MoneyPlanCategoriesSuccess(this.moneyplans);

  @override
  List<Object> get props => [moneyplans];
}
