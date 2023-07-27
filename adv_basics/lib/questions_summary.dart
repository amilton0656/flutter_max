import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                Text(((data['question_index'] as int) + 1).toString(), textAlign: TextAlign.justify),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String,
              style: GoogleFonts.lato(
                color: Colors.white, fontSize: 16
              ), textAlign: TextAlign.right),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String,
              style: GoogleFonts.lato(
                color: Colors.white, fontSize: 14
              ), textAlign: TextAlign.right),
                      Text(data['correct_answer'] as String),
                
                    ],
                  ),
                ),
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
