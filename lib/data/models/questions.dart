abstract class Question {
  final String type;
  final String questionDescription;
  final String questionText;

  Question(
      {required this.type,
      required this.questionDescription,
      required this.questionText});
}

class CorrectIncorrectQuestionModel extends Question {
  final List<String> options;
  final int correctIndex;
  CorrectIncorrectQuestionModel(
      {required this.options,
      required this.correctIndex,
      required super.questionDescription,
      required super.questionText})
      : super(type: 'correct_incorrect');
}

class MultipleCorrectIncorrectQuestionModel extends Question {
  final List<String> options;
  final List<int> correctIndexList;

  MultipleCorrectIncorrectQuestionModel(
      {required super.questionDescription,
      required this.options,
      required this.correctIndexList,
      required super.questionText})
      : super(type: 'multiple_correct_incorrect');
}

class RecallQuestionModel extends Question {
  final String recallText;

  RecallQuestionModel(
      {required super.questionDescription,
      required this.recallText,
      required super.questionText})
      : super(type: 'recall');
}

class IdentificationOptions {
  final String imgPath;
  final String option;
  IdentificationOptions({
    required this.imgPath,
    required this.option,
  });
}

class IdentificationQuestionModel extends Question {
  final List<IdentificationOptions> options;
  final int correctIndex;
  IdentificationQuestionModel(
      {required super.questionDescription,
      required this.options,
      required this.correctIndex,
      required super.questionText})
      : super(type: 'identification');
}


final List<Question> dummyQuestions = [
    CorrectIncorrectQuestionModel(
      questionText: 'How many fingers do you see?',
      questionDescription: "Please show the patient a certain amount of fingers and follow their reaction",
      options: ["Correct", "Incorrect"],
      correctIndex: 0
    ),
    MultipleCorrectIncorrectQuestionModel(
      questionText: 'Story "Jill went to the shop"',
      questionDescription: "Jill went to the shop to buy candies. Afterwards instead of walking home, she took a cab. When she arrived home, she found her cat waiting at the door. She fed her cat and then sat down to enjoy her candies while watching her favorite TV show. Later, she called her friend to share the news about her day. ",
      options: ['Jill bought candies', 'Jill has a dog as a pet.', 'Jill took a cab.'],
      correctIndexList: [0,2]
    ),
    RecallQuestionModel(
      questionText: 'Read the sentences',
      recallText: 'Recall question',
      questionDescription: "Proin ultrices fringilla et scelerisque sed duis massa nulla. Eget arcu urna ipsum in neque ornare. Integer placerat rhoncus purus est ut ultrices. Pharetra amet faucibus tincidunt mattis in enim. Duis pharetra integer adipiscing quisque elementum lacus porta. Sit diam aliquam quisque purus tortor.Ut turpis consectetur massa libero. Habitant lobortis dictum pretium et tortor facilisi in enim porttitor. Purus porta pulvinar sit ultrices aliquam ultrices lacus quam. Gravida etiam facilisis enim purus ornare quis donec leo dignissim. Etiam at non aliquam quis. Pellentesque pellentesque at amet vitae turpis hac in. Felis eu purus vel interdum accumsan lorem dictu."
    ),
    IdentificationQuestionModel(
      questionText: 'Identify the animals',
      questionDescription: "Please show the patient the following animals and check their response.",
      options: [IdentificationOptions(imgPath: "assets/images/hen.png", option: "Chicken"),IdentificationOptions(imgPath: "assets/images/horse.png", option: "Horse"),IdentificationOptions(imgPath: "assets/images/dog.png", option: "Dog"), ],
      correctIndex: 0
    ),
  ];