import 'package:tcc/model/patient.dart';

abstract class AppNavigatorEvent {}

class HomeCalled extends AppNavigatorEvent {}

class LoginCalled extends AppNavigatorEvent {}

class PatientDetailsCalled extends AppNavigatorEvent {
  Patient selectedPatient;

  PatientDetailsCalled(this.selectedPatient);
}
