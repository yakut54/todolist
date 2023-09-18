import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '/db/db.dart';
import '/db/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<LoadAllTodosEvent>(_onGetAllTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteAllTodosEvent>(_onDelAllTodo);
    on<UpdateIsDoneEvent>(_onUpdateIsDone);
    on<DeleteTodoEvent>(_onDelTodo);
  }

  void _onGetAllTodos(LoadAllTodosEvent event, Emitter<TodoState> emit) async {
    List<Todo> alltodosDb = await LDB().getTodos();

    emit(TodoState(allTodos: alltodosDb));
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    await LDB().insertTodo(event.todo);

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(allTodos: List.from(alltodosDb)));
  }

  void _onDelAllTodo(DeleteAllTodosEvent event, Emitter<TodoState> emit) async {
    await LDB().deleteAllTodo();

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(allTodos: List.from(alltodosDb)));
  }

  void _onUpdateIsDone(UpdateIsDoneEvent event, Emitter<TodoState> emit) async {
    final isDone = event.todo.isDone == 0 ? 1 : 0;

    await LDB().updateTodo(event.todo.copyWith(isDone: isDone));

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(allTodos: List.from(alltodosDb)));
  }

  void _onDelTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    await LDB().deleteTodo(event.todo.id!);

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(allTodos: List.from(alltodosDb)));
  }
}
