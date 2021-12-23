enum Disease { NONE, DIABETES, ASMA }

class DiseaseStatusHelper {
  static Disease fromString(String name) {
    switch (name) {
      case "DIABETES":
        return Disease.DIABETES;
      case "ASMA":
        return Disease.ASMA;
    }

    return Disease.NONE;
  }

  static String diseaseToString(Disease disease) {
    switch (disease) {
      case Disease.DIABETES:
        return "Diabetes";
      case Disease.ASMA:
        return "Asma";
    }

    return "";
  }
}
