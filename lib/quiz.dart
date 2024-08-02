import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/result_screen.dart';
class Quiz extends StatefulWidget{
const Quiz({super.key});
   @override
  State<Quiz> createState() {
    return _QuizState();

  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';

  void switchScreen(){
    setState(() {
      activeScreen='question-screen';
    });
  }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
       
        activeScreen='result-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget= StartScreen(switchScreen);
    if(activeScreen=='question-screen'){
            screenWidget= QuestionScreen(
              onSelectAnswers: chooseAnswers,);  
    }

    if(activeScreen=='result-screen'){
      screenWidget=ResultScreen(choseAnswers: selectedAnswers,onRestart: restartQuiz,);
    }
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 197, 110, 97),
                  Color.fromARGB(255, 101, 3, 103)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child:screenWidget,
            ),
      ),
    );
    
  }
}