import 'package:tcc/model/patient.dart';

enum PatientsStatus { INITIAL, SUCCESS, FAILURE, EMPTY }

class PatientsState {
  final PatientsStatus status;
  final List<Patient> patients;

  const PatientsState(
      {this.status = PatientsStatus.INITIAL, this.patients = const []});

  PatientsState copyWith({PatientsStatus status, List<Patient> patients}) =>
      PatientsState(status: status, patients: patients);
}
