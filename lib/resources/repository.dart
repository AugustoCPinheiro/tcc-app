import 'package:tcc/model/patient.dart';
import 'package:tcc/resources/patients_api_provider.dart';

class Repository {
  final _patientsApiProvider = PatientsApiProvider();

  Future<List<Patient>> fetchAllPatients() =>
      _patientsApiProvider.fetchPatients();
}
