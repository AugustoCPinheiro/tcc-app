import 'dart:convert';

import 'package:tcc/model/patient.dart';
import 'package:tcc/resources/base_api_provider.dart';
import 'package:tcc/util/http_status.dart';

class PatientsApiProvider extends BaseApiProvider {
  Future<List<Patient>> fetchPatients() async {
    final response = await client.get(buildUrl("patients"));
    print(response.body.toString());
    if (response.statusCode == HttpStatus.OK) {
      List<Patient> patients = List<Patient>.from(
          (json.decode(response.body) as List).map((e) => Patient.fromJson(e)));
      return patients;
    } else {
      throw Exception('Failed to load pacient');
    }
  }
}
