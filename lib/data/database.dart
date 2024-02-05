import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [];
  // reference our box
  final _myBox = Hive.box('box');

  // run this if this is the first time opening the app
  void createInitialData() {
    todoList = [
      ["Make Money", false],
      ["Be Rich", false],
    ];
  }

  // load the data from the database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLST", todoList);
  }
}
