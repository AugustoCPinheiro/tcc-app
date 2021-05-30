import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc/navigation/app_navigator_event.dart';
import 'package:tcc/navigation/app_navigator_state.dart';

class AppNavigatorBloc extends Bloc<AppNavigatorEvent, AppNavigatorState> {
  List<Page> navigationStack = [];

  AppNavigatorBloc(AppNavigatorState initialState) : super(initialState);

  @override
  Stream<AppNavigatorState> mapEventToState(AppNavigatorEvent event) async* {
    if (event is HomeCalled) {
      yield state.copyWith(status: NavigatorStatus.HOME);
    }
    if (event is LoginCalled) {
      yield state.copyWith(status: NavigatorStatus.LOGIN);
    }

    if (event is PatientDetailsCalled) {
      yield AppNavigatorState.withPayload(
          NavigatorStatus.PATIENT_DETAILS, event.selectedPatient);
    }
  }
}
