class Answers {
  String? identifier;
  String? answer;
  Answers({
    this.identifier,
    this.answer,
  });

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String correctAnswer;

  Questions(
    this.id,
    this.question,
    this.answers,
    this.correctAnswer,
  );

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        // if (json['answers'] != null) {
        //   answers = <Answers>[];
        //   json['answers'].forEach(
        //     (answer) => answers.add(
        //       Answers.fromJson(answer),
        //     ),
        //   );
        // }
        answers = (json['answers'] as List)
            .map(
              (e) => Answers.fromJson(e),
            )
            .toList(),
        correctAnswer = json['correct_answer'];
}

class QuestionPaperModel {
  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds;
  List<Questions> questions;
  QuestionPaperModel(
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.timeSeconds,
    this.questions,
  );
}
