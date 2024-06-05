class Assessment {
  final String cognitiveStatus;
  final String applicableMeasures;
  final String patientName;
  final String gender;
  final int age;
  final int weight;
  final DateTime date;
  Assessment({
    required this.cognitiveStatus,
    required this.applicableMeasures,
    required this.patientName,
    required this.gender,
    required this.age,
    required this.weight,
    required this.date,
  });
}

final List<Assessment> dummyAssessment = [
  Assessment(
      cognitiveStatus: "Z00.00",
      applicableMeasures: "Physical Examination",
      patientName: "Emerson Calzeni",
      gender: "Male",
      age: 36,
      weight: 84,
      date: DateTime(2024,03,02)),
  Assessment(
      cognitiveStatus: "Z01.89",
      applicableMeasures: "Diagnostic Tests",
      patientName: "Davis Culhane",
      gender: "Male",
      age: 41,
      weight: 84,
      date: DateTime(2024,03,01)),
  Assessment(
      cognitiveStatus: "Z01.89",
      applicableMeasures: "Diagnostic Tests",
      patientName: "Davis Culhane",
      gender: "Male",
      age: 41,
      weight: 84,
      date: DateTime(2024,03,01)),
];
