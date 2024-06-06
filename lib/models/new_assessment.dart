
class BaseAssessment {
  final String cognitiveStatus;
  final String applicableMeasures;
  final String patientName;

  BaseAssessment({
    required this.cognitiveStatus,
    required this.applicableMeasures,
    required this.patientName,
  });

  BaseAssessment copyWith({
    String? cognitiveStatus,
    String? applicableMeasures,
    String? patientName,
  }) {
    return BaseAssessment(
      cognitiveStatus: cognitiveStatus ?? this.cognitiveStatus,
      applicableMeasures: applicableMeasures ?? this.applicableMeasures,
      patientName: patientName ?? this.patientName,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'cognitiveStatus': cognitiveStatus});
    result.addAll({'applicableMeasures': applicableMeasures});
    result.addAll({'patientName': patientName});
  
    return result;
  }

}


class Assessment extends BaseAssessment {
  final String gender;
  final int age;
  final int weight;
  final DateTime date;

  Assessment({
    required super.cognitiveStatus,
    required super.applicableMeasures,
    required super.patientName,
    required this.gender,
    required this.age,
    required this.weight,
    required this.date,
  });

  @override
  Assessment copyWith({
    String? cognitiveStatus,
    String? applicableMeasures,
    String? patientName,
    String? gender,
    int? age,
    int? weight,
    DateTime? date,
  }) {
    return Assessment(
      cognitiveStatus: cognitiveStatus ?? this.cognitiveStatus,
      applicableMeasures: applicableMeasures ?? this.applicableMeasures,
      patientName: patientName ?? this.patientName,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      date: date ?? this.date,
    );
  }
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
