import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key,required this.onSelectAnswers});

  final void Function(String answer) onSelectAnswers;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();

  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuistionIndex=0;

  void answerQuistion(String selectedAnswers){
    widget.onSelectAnswers(selectedAnswers);

    setState(() {
        currentQuistionIndex++;
    });
  

  }

  @override
  Widget build(context) {
    final currentQuistion=questions[currentQuistionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
         Text(currentQuistion.text
          ,style:GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign:TextAlign.center,
          ),
          const SizedBox(height: 30,),
          ...currentQuistion.getShuffledAnswers().map((answer){
            return AnswerButton(answerText: answer, 
            onTap: (){
              answerQuistion(answer);
            });
          }),
        
        ],),
      ),
    );
    
  }
}