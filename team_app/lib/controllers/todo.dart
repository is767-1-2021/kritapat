import 'dart:async';

import 'package:whatHome/model/todo.dart';
import 'package:whatHome/services/services.dart';

class TodoController {
  final Services services;
  List<FoodCard> foods = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.services);

  Future<List<FoodCard>> fecthTodos() async {
    onSyncController.add(true);
    foods = await services.getTodos();
    onSyncController.add(false);
    return foods;
  }

  Future<void> updateTodo(int id, bool completed) async {
    await services.updateTodos(id, completed);
  }
}
