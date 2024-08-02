import 'package:adv_basics/question_summary.dart';

import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
   required this.choseAnswers,
   required this.onRestart,
   }); 

   final void Function() onRestart;
   

  final List<String> choseAnswers;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary=[];
   
    for(var i=0;i<choseAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choseAnswers[i],

      },
      );
    }
   
   return summary;
  }

  @override
  Widget build(context) {
    final summaryData=getSummaryData();
    final numTotalQuestion=questions.length;
    final numCorrectQuestion=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestion out of $numTotalQuestion question',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 229, 219, 219),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),

            TextButton.icon(onPressed:onRestart , 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.refresh),
            label: const Text('Restart Quiz!'),
            )

          ],
        ),
      ),
    );
  }
}
