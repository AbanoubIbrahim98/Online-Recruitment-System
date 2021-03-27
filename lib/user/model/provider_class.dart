import 'package:flutter/material.dart';

class GetListView with ChangeNotifier {
  List<Widget> myListView = [];
  List<String>  questionsList=[];
  String jobTitleProvider;

  removeFromList(){
    myListView.removeAt(myListView.length-1);
    notifyListeners();
  }

  addToList(List<Widget> items){
    myListView.addAll(items);
    notifyListeners();
  }


  addToListQuestions(String question){
    questionsList.add(question);
    notifyListeners();
  }

  getJobTitle(String title){
    jobTitleProvider=title;
    notifyListeners();

  }


}
