import 'package:tcc/model/disease.dart';

class AdmissionHealthStatus {
  int id;
  int patientHealthId;
  List<Disease> diseases;

  AdmissionHealthStatus.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        patientHealthId = json["patientHealthId"],
        diseases = (json["diseases"] as List)
            .map<Disease>((e) => DiseaseStatusHelper.fromString(e))
            .toList();
}
