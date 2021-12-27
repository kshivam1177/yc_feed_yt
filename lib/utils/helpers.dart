class Helpers {
  static String getClassCardTag({
    String? programType,
    String? continuityType,
  }) {
    switch (programType) {
      case "REGULAR":
        if (continuityType == "CONTINUOUS") {
          return 'WORKSHOP';
        } else if (continuityType == "FIXED") {
          return 'PROGRAM';
        }
        return '';
      default:
        return programType ?? '';
    }
  }
}
