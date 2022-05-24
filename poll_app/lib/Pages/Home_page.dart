import 'package:flutter/material.dart';
import 'package:poll_app/Models/Qestion.dart';
import 'package:poll_app/Widgets/answer.dart';
import 'package:poll_app/Pages/Result.dart';
import 'package:poll_app/Models/ResultsAnswers.dart';

class HomePage extends StatefulWidget {
  final String userName;
  HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(this.userName);
}

class _HomePageState extends State<HomePage> {

  _HomePageState(this.userName);

  final userName;
  final QuestionData data = QuestionData();
  int _questionIndex = 0;
  int dataLength = 0;
  final ResultAnswersData resultAnswersList = ResultAnswersData();

  @override
  void initState() {
    super.initState();
    dataLength = data.qestions.length;
  }

  void clearState() => setState(() {
    _questionIndex = 0;
  });

  void _onChangeAnswer(String answer) {
    if(_questionIndex < dataLength - 1) {
      ResultAnswer resultAnswer = ResultAnswer(questionNumber: data.qestions[_questionIndex].title, answerOption: answer);
      resultAnswersList.data.add(resultAnswer);
      setState(() {
        _questionIndex++;
      });
    }
    else {
      ResultAnswer resultAnswer = ResultAnswer(questionNumber: data.qestions[_questionIndex].title, answerOption: answer);
      resultAnswersList.data.add(resultAnswer);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Result(list: resultAnswersList.data, user: userName,)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: AppBar(
        title: Text('Опитування'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext contex, int index) {
          return Container(
            //color: Colors.deepOrangeAccent,
            padding: const EdgeInsets.all(10),
            child: Column(
                children: <Widget>[
                  Text(
                    data.qestions[_questionIndex].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10),),
                  ...data.qestions[_questionIndex].answers.map(
                          (key) =>
                          Answer(
                            title: key['answer'],
                            onChangeAnswer: _onChangeAnswer,
                          )
                  ).toList(),
                ]
            ),
          );
        }
        ),
    );
  }
}
