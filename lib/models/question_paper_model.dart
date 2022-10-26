import 'package:cloud_firestore/cloud_firestore.dart';

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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String correctAnswer;

  Questions({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List)
            .map(
              (e) => Answers.fromJson(e),
            )
            .toList(),
        correctAnswer = json['correct_answer'];

  Questions.fromQuerySnapshots(DocumentSnapshot<Map<String, dynamic>> json)
      : answers = json['answers'],
        correctAnswer = json['correct_answer'],
        id = json.id,
        question = json['question'];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (answers != null) {
      data['answers'] = answers.map((e) => e.toJson()).toList();
    }
    data['correct_answer'] = correctAnswer;
    return data;
  }
}

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  QuestionPaperModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    this.questions,
    required this.questionCount,
  });

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((ques) => Questions.fromJson(ques))
            .toList();

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        timeSeconds = json['time_seconds'],
        questionCount = json['question_count'] as int,
        questions = [];

  String timeInMinute() {
    if (timeSeconds > 60) {
      return "${timeSeconds / 60} mins";
    }
    return "$timeSeconds secs";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    // if (this.questions != null) {
    //   data['questions'] = this.questions!.map((e) => e.toJson()).toList();
    // }
    return data;
  }
}
