import 'package:whatHome/controllers/todo.dart';
import 'package:whatHome/model/todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  TodoPage({this.controller});
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<FoodCard> todos = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
    widget.controller.onSync
        .listen((bool syncState) => setState(() => isLoading = syncState));
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fecthTodos();
    setState(() {
      todos = newTodos;
    });
  }

  void _updateTodos(int _id, bool _completed) async {
    await widget.controller.updateTodo(_id, _completed);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: todos.isEmpty ? 1 : todos.length,
          itemBuilder: (context, index) {
            if (todos.isEmpty) {
              return Text('Tap button to fetch Todos');
            }
            return CheckboxListTile(
              onChanged: null,
              value: todos[index].completed,
              title: Text(todos[index].foodName),
            );
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List'),
        backgroundColor: Colors.green[800],
      ),
      body: Center(
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}
