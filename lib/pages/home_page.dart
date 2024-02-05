// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/pages/component/dialog_box.dart';
import 'package:todo_app/pages/component/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // refrencing the box in the homePage
  final _myBox = Hive.box('box');
  ToDoDataBase db = ToDoDataBase();
  bool isChecked = false;

  @override
  void initState() {
    // if this is the first time opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // This is for the checkbox method
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateDataBase();
    });
  }

  void clearText() {
    _controller.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // this is for message pop up
  void showMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Checkbox Checked!'),
          content: Text('The checkbox has been checked.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // _controller.clear();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // save a new task
  void saveNewTodo() {
    setState(() {
      db.todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTodo,
              onCancel: () => Navigator.of(context).pop());
        });
  }

// delete task section
  void deleTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        drawer: Drawer(
          backgroundColor: Colors.yellow[200],
          child: Column(
            children: [
              // this is where the draweer is being placed
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 30,
                ),
              ),

              // signup/login page list tile
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("L O G I N"),
                onTap: () {
                  // pop drawer first then this will close it
                  Navigator.pop(context);
                  // go to login page
                  Navigator.pushNamed(context, '/login');
                },
              ),

              ListTile(
                leading: Icon(Icons.lock),
                title: Text("S I G N U P"),
              ),

              // contact Us page
              ListTile(
                leading: Icon(Icons.person),
                title: Text("CONTACT US"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            'TO DO',
            style: Theme.of(context).primaryTextTheme.titleMedium,
          ),
          //elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.todoList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.todoList[index][0],
                taskCompleted: db.todoList[index][1],
                onChanged: (value) => CheckBoxChanged(value, index),
                deleFunction: (context) => deleTask(index),
                //completeFunction: (context) => completeTask(index),
              );
            }));
  }
}
