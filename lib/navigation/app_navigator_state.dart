enum NavigatorStatus { HOME, LOGIN, PATIENT_DETAILS, CHARTS }

class AppNavigatorState {
  final NavigatorStatus status;
  final dynamic payload;

  AppNavigatorState(this.status) : payload = null;

  AppNavigatorState.withPayload(this.status, this.payload);

  AppNavigatorState copyWith({NavigatorStatus status}) {
    return AppNavigatorState(status);
  }
}
