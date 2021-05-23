import 'dart:async';

import 'package:tcc/model/patient.dart';
import 'package:tcc/resources/repository.dart';

class PatientsBloc {
  final _repository = Repository();
  final _patientsController = StreamController<List<Patient>>();

  fetchAllPatients() async {
    List<Patient> patients = await _repository.fetchAllPatients();
    print(patients);
    _patientsController.sink.add(patients);
  }

  closeStream() {
    _patientsController.close();
  }

  Stream getPatientsStream() {
    return _patientsController.stream;
  }
}
