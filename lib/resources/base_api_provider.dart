import 'package:http/http.dart';

abstract class BaseApiProvider {
  String _baseUrl = "http://10.0.2.2:3000/";
  Client client = Client();

  Uri buildUrl(String endpoint) => Uri.parse("$_baseUrl$endpoint");
}
