import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneywise_app/models/money_plan_form_model.dart';
import 'package:moneywise_app/services/money_plan_service.dart';

part 'add_money_plan_event.dart';
part 'add_money_plan_state.dart';

class AddMoneyPlanBloc extends Bloc<AddMoneyPlanEvent, AddMoneyPlanState> {
  AddMoneyPlanBloc() : super(AddMoneyPlanInitial()) {
    on<AddMoneyPlanEvent>((event, emit) async {
      if (event is AddMoneyPlanPost) {
        try {
          emit(AddMoneyPlanLoading());

          await MoneyPlanService().createMoneyPlan(event.data);

          emit(AddMoneyPlanSuccess());
        } catch (e) {
          emit(AddMoneyPlanFailed(e.toString()));
        }
      }
    });
  }
}
