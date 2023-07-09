// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:todolist_flutter/models/todo.dart';
import 'package:todolist_flutter/screens/add_todo_screen.dart';
import 'package:todolist_flutter/widgets/todo_widget.dart';
import 'package:todolist_flutter/services/db_helper.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTodoScreen()));
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      body: FutureBuilder<List<Todo>?>(
        future: DBHelper.getAllTodo(),
        builder: (context, AsyncSnapshot<List<Todo>?> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            if (snapshot.data == null ) {
              return const Center(child: Text('Nothing todo'));
            } else {
              return _todoItem(snapshot.data);
            }
          }

          return const SizedBox.shrink();
        },
      )
    );

  }

  Widget _todoItem (dynamic data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => TodoWidget(
        todo: data[index],
        onTap: () {
          print('hello');
        },
        onLongPress: () {
          print('hello');
        },
      )
    );
  }
  
}