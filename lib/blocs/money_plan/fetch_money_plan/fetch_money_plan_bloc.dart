import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moneywise_app/models/money_plan_model.dart';
import 'package:moneywise_app/services/money_plan_service.dart';

part 'fetch_money_plan_event.dart';
part 'fetch_money_plan_state.dart';

class FetchMoneyPlanBloc
    extends Bloc<FetchMoneyPlanEvent, FetchMoneyPlanState> {
  FetchMoneyPlanBloc() : super(FetchMoneyPlanInitial()) {
    on<FetchMoneyPlanEvent>((event, emit) async {
      if (event is FetchMoneyPlanGet) {
        try {
          emit(FetchMoneyPlanLoading());

          final moneyplans = await MoneyPlanService().getMoneyPlans();

          emit(FetchMoneyPlanSuccess(moneyplans));
        } catch (e) {
          emit(FetchMoneyPlanFailed(e.toString()));
        }
      }
    });
  }
}
