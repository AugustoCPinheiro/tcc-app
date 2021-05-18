import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:tcc/model/patient.dart';
import 'package:tcc/persistence/facade/persistence_facade.dart';

class PatientPersistenceFileController
    extends PersistenceFacade<Patient, String> {
  @override
  Future<Patient> find(String patientCode) async {
    List<Patient> patients = await findAll();

    return patients
        .singleWhere((element) => element.patientCode == patientCode);
  }

  @override
  Future<List<Patient>> findAll() async {
    final file = await _localFile;

    String fileData = await file.readAsString();
    Map<String, dynamic> json = jsonDecode(fileData);

    return [Patient.fromJson(json)];
  }

  @override
  save(Patient patient) async {
    final file = await _localFile;

    file.writeAsString(jsonEncode(patient.toJson()));
  }

  @override
  saveAll(List<Patient> patients) async {
    final file = await _localFile;

    file.writeAsString(jsonEncode(patients.map((e) => e.toJson())));
  }

  @override
  Future<void> update(String id, Patient record) {}

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/patient.json");
  }
}
