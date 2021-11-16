import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_health.dart';

abstract class AppNavigatorEvent {}

class HomeCalled extends AppNavigatorEvent {}

class LoginCalled extends AppNavigatorEvent {}

class PatientDetailsCalled extends AppNavigatorEvent {
  Patient selectedPatient;

  PatientDetailsCalled(this.selectedPatient);
}

class ChartsPageCalled extends AppNavigatorEvent {
  Patient currentPatient;
  PatientHealth currentPatientHealth;

  ChartsPageCalled(this.currentPatient, this.currentPatientHealth);
}
