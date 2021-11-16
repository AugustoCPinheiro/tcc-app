abstract class PatientDetailsEvent {}

class PatientDetailsFetched extends PatientDetailsEvent {
  String patientCode;
  PatientDetailsFetched(this.patientCode);
}
