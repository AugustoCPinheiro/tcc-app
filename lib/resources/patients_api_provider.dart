import 'dart:convert';

import 'package:tcc/model/patient.dart';
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
}
