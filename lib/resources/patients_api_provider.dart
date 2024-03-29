import 'dart:convert';

import 'package:tcc/model/patient.dart';
import 'package:tcc/model/patient_health.dart';
import 'package:tcc/resources/base_api_provider.dart';
import 'package:tcc/util/http/http_error.dart';
import 'package:tcc/util/http/http_status.dart';

class PatientsApiProvider extends BaseApiProvider {
  Future<List<Patient>> fetchPatients() async {
    final response = await client.get(buildUrl("patients"));

    switch (response.statusCode) {
      case HttpStatus.OK:
        {
          List<Patient> patients = List<Patient>.from(
              (json.decode(response.body) as List)
                  .map((e) => Patient.fromJson(e)));
          return patients;
        }
      case HttpStatus.BAD_REQUEST:
        return Future.error(BadRequestError());
      case HttpStatus.INTERNAL_SERVER_ERROR:
        return Future.error(InternalServerError());

      default:
        throw Exception("Untreated http verb");
    }
  }

  Future<PatientHealth> fetchPatientDetails(String patientCode) async {
    final response = await client.get(buildUrl(
        "patientHealth/$patientCode?_embed=admissionHealthStatus&_embed=healthData"));
    print(response.body);
    switch (response.statusCode) {
      case HttpStatus.OK:
        {
          PatientHealth patientHealth =
              PatientHealth.fromJson(json.decode(response.body));

          return patientHealth;
        }

      case HttpStatus.BAD_REQUEST:
        return Future.error(BadRequestError());
      case HttpStatus.INTERNAL_SERVER_ERROR:
        return Future.error(InternalServerError());

      default:
        throw Exception("Untreated http verb");
    }
  }

  Future<void> patchAlertPatient(String patientCode) async {
    await client.patch(buildUrl("patients/$patientCode"),
        body: {"patientStatus": "NORM"});
  }
}
