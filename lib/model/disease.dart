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
}
