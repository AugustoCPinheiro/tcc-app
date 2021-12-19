enum PatientHealthStatus {
  Normal,
  Alert,
}

class PatientHealthStatusHelper {
  static PatientHealthStatus fromString(String name) {
    switch (name) {
      case "NORM":
        return PatientHealthStatus.Normal;
      case "ALERT":
        return PatientHealthStatus.Alert;
    }

    return PatientHealthStatus.Normal;
  }
}
