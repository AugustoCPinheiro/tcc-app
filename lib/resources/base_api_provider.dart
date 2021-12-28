import 'package:http/http.dart';

abstract class BaseApiProvider {
  static const String _TEST_HOST = "http://10.0.2.2:3000/";
  static const String _DEV_HOST = "http://192.168.0.196:3000/";
  static const String _HML_HOST =
      "https://nameless-stream-97494.herokuapp.com/";
  String _baseUrl = _HML_HOST;
  Client client = Client();

  Uri buildUrl(String endpoint) => Uri.parse("$_baseUrl$endpoint");
}
