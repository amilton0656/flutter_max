import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers});

  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }

    return summary;
  }
  

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('You answered x out of y questions correctly!'),
              const SizedBox(height: 30),
              QuestionsSummary(getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text('Restart Quiz!'),
              ),
            ]),
      ),
    );
  }
}
