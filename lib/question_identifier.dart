import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({super.key,
  required this.isCorrectAnswer,
  required this.questionIndex});

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber=questionIndex+1;
    return Container(
      width: 30,
      height: 30,
      alignment:Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
        ?const Color.fromARGB(255, 150, 190, 241)
        : const Color.fromARGB(255, 247, 122, 241),
        borderRadius: BorderRadius.circular(100)
      ),
      child:Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 3, 13)
        ),
      )
    );
  }
}