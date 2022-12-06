import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneywise_app/models/money_plan_categories_model.dart';
import 'package:moneywise_app/services/money_plan_service.dart';

part 'money_plan_categories_event.dart';
part 'money_plan_categories_state.dart';

class MoneyPlanCategoriesBloc
    extends Bloc<MoneyPlanCategoriesEvent, MoneyPlanCategoriesState> {
  MoneyPlanCategoriesBloc() : super(MoneyPlanCategoriesInitial()) {
    on<MoneyPlanCategoriesEvent>((event, emit) async {
      if (event is MoneyPlanCategoriesGet) {
        try {
          emit(MoneyPlanCategoriesLoading());

          final moneyPlanCategories =
              await MoneyPlanService().getMoneyPlanCategories();

          emit(MoneyPlanCategoriesSuccess(moneyPlanCategories));
        } catch (e) {
          emit(MoneyPlanCategoriesFailed(e.toString()));
        }
      }
    });
  }
}
