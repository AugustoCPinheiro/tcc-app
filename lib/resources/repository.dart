import 'package:tcc/model/patient.dart';
import 'package:tcc/model/user_auth.dart';
import 'package:tcc/resources/auth_api_provider.dart';
import 'package:tcc/resources/patients_api_provider.dart';
import 'package:tcc/util/http/http_error.dart';

class Repository {
  final _patientsApiProvider = PatientsApiProvider();
  final _authApiProvider = AuthApiProvider();

  Future<List<Patient>> fetchAllPatients() =>
      _patientsApiProvider.fetchPatients();

  Future<bool> authUser(UserAuth userAuth) async {
    try {
      _authApiProvider.authorize(userAuth);

      return true;
    } catch (e) {
      if (e is BadRequestError) {
        return false;
      }
    }
  }
}
