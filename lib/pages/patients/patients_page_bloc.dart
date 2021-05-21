import 'dart:async';

import 'package:tcc/model/patient.dart';
import 'package:tcc/resources/repository.dart';

class PatientsPageBloc {
  final _repository = Repository();
  final _patientsController = StreamController<List<Patient>>();

  fetchAllPatients() async {
    var patients = await _repository.fetchAllPatients();
    _patientsController.sink.add(patients);
  }

  closeStream() {
    _patientsController.close();
  }

  Stream getPatientsStream() {
    return _patientsController.stream;
  }
}
