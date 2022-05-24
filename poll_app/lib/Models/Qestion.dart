import 'package:flutter/foundation.dart';

class Question {
  final String title;
  final List<Map> answers;

  Question({
    required this.title,
    required this.answers,
  });
}

class QuestionData {
  final _data = [
    Question(
        title: '1. Чи користувались ви послугами Mono Bank?',
        answers: [
          {'answer' : 'Так, користувався',},
          {'answer' : 'Ні, не користувався',},
        ]
    ),
    Question(
        title: '2. Як давно ви користувались послугами Mono Bank?',
        answers: [
          {'answer' : '3-4 тижні назад',},
          {'answer' : '2-4 місяці назад',},
          {'answer' : '2 роки',},
          {'answer' : 'Взагалі не користувався/лась',},
        ]
    ),
    Question(
        title: '3. Чи сподобались послуги компанії, якщо ви ними користувалися?',
        answers: [
          {'answer' : 'Так',},
          {'answer' : 'Ні',},
          {'answer' : 'Більше ні, аніж так',},
          {'answer' : 'Я взагалі не користувався/лась послугами цієї компанії',},
        ]
    ),
    Question(
        title: '4. Що вам сподобалось в  Mono Bank?',
        answers: [
          {'answer' : 'Зручний додаток',},
          {'answer' : 'Робота підтримки',},
          {'answer' : 'Вчасні виплати',},
        ]
    ),
    Question(
        title: '5. Чи виникали у вас проблеми з Mono Bank?',
        answers: [
          {'answer' : 'Так',},
          {'answer' : 'Ні',},
        ]
    ),
    Question(
        title: '6. Наскільки ви задоволені якістю обслуговування Mono Bank?',
        answers: [
          {'answer' : 'Задоволена/ний',},
          {'answer' : 'Незадоволена/ний',},
        ]
    ),
    Question(
        title: '7. Користуєтесь послоую "Банка?"',
        answers: [
          {'answer' : 'Так',},
          {'answer' : 'Ні',},
        ]
    ),
    Question(
        title: '8. Чи приймали ви участь в акціях від  Mono Bank?',
        answers: [
          {'answer' : 'Так',},
          {'answer' : 'Ні',},
          {'answer' : 'Так,Часто приймаю участь',},
        ]
    ),
    Question(
        title: '9. Де можна знайти головене відділення Mono Bank?',
        answers: [
          {'answer' : 'В Києві',},
          {'answer' : 'В чорнобаївці',},
          {'answer' : 'В  Mono Bank немає головного відділення',},
        ]
    ),
    Question(
        title: '10. Чи рекомендували б ви користуватися послугами  Mono Bank для близьких/рідних?',
        answers: [
          {'answer' : 'Так',},
          {'answer' : 'Ні',},
          {'answer' : 'Можливо',},
        ]
    ),
  ];
  List<Question> get qestions => [..._data];
}