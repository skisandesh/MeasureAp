class History {
  final String code;
  final String testType;
  final String patientName;
  final String gender;
  final int age;
  final int weight;
  final DateTime date;
  History({
    required this.code,
    required this.testType,
    required this.patientName,
    required this.gender,
    required this.age,
    required this.weight,
    required this.date,
  });
}

final List<History> dummyHistory = [
  History(
      code: "Z00.00",
      testType: "Physical Examination",
      patientName: "Emerson Calzeni",
      gender: "Male",
      age: 36,
      weight: 84,
      date: DateTime(2024,03,02)),
  History(
      code: "Z01.89",
      testType: "Diagnostic Tests",
      patientName: "Davis Culhane",
      gender: "Male",
      age: 41,
      weight: 84,
      date: DateTime(2024,03,01)),
  History(
      code: "Z01.89",
      testType: "Diagnostic Tests",
      patientName: "Davis Culhane",
      gender: "Male",
      age: 41,
      weight: 84,
      date: DateTime(2024,03,01)),
];
