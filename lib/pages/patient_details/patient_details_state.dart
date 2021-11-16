import 'package:tcc/model/patient_health.dart';

enum PatientDetailsStatus { INITIAL, SUCCESS, ERROR }

class PatientDetailsState {
  final PatientDetailsStatus status;
  final PatientHealth patientHealth;

  const PatientDetailsState(
      {this.status = PatientDetailsStatus.INITIAL, this.patientHealth});

  PatientDetailsState copyWith(
          {PatientDetailsStatus status, PatientHealth patientHealth}) =>
      PatientDetailsState(status: status, patientHealth: patientHealth);
}
