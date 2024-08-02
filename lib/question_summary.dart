import 'package:adv_basics/summary_item.dart';
import 'package:flutter/widgets.dart';

class QuestionSummary extends StatelessWidget{
  const QuestionSummary(this.summaryData,{super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
           return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}