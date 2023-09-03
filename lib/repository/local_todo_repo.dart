import 'package:todolist/db/db.dart';
import 'package:todolist/db/todo_model.dart';


class TodoLocalRepository {

  Future getListTodoRepo<Todo>() async {

    try {
      final todoList = await LDB().getTodos();
      return todoList;
    } catch(e){
      print(e.toString());
    }
  }

  Future insertTodoRepo() async {
    try {
      await LDB().insertTodo(
        const Todo(
            isDone: 1,
            name: 'green Bleat!',
            deadline: 32323233223,
            importance: 'green'),
      );
    } catch(e) {
      print(e.toString());
    }
  }

  Future updateTodoRepo() async {
    try {
      await LDB().updateTodo(
        const Todo(
            id: 1,
            isDone: 0,
            name: 'Юличка-Вонючка 😘',
            deadline: 32323233223,
            importance: 'green'),
      );
    } catch(e) {
      print(e.toString());
    }
  }

  Future deleteTodoRepo(int num) async {
    try {
      await LDB().deleteTodo(num);
    } catch(e) {
      print(e.toString());
    }
  }

  Future deleteAllTodoRepo() async {
    try {
      await LDB().deleteAllTodo();
    } catch(e) {
      print(e.toString());
    }
  }
}
