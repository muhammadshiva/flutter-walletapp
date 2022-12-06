import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_money_plan_event.dart';
part 'edit_money_plan_state.dart';

class EditMoneyPlanBloc extends Bloc<EditMoneyPlanEvent, EditMoneyPlanState> {
  EditMoneyPlanBloc() : super(EditMoneyPlanInitial()) {
    on<EditMoneyPlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
