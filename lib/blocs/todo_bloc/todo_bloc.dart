import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '/db/db.dart';
import '/db/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

Todo defaultEditableTodo = Todo(
  deadline: 1695194401448,
  importance: 'green',
  title: '...',
);

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(editableTodo: defaultEditableTodo)) {
    on<LoadAllTodosEvent>(_onGetAllTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteAllTodosEvent>(_onDelAllTodo);
    on<UpdateIsDoneEvent>(_onUpdateIsDone);
    on<DeleteTodoEvent>(_onDelTodo);
    on<CreateEditableTodoEvent>(_onCreateEditableTodo);
    on<UpdateColorEvent>(_onUpdateColor);
    on<UpdateTitleEvent>(_onUpdateTitle);
    on<ResetEvent>(_onReset);
  }

  void _onGetAllTodos(LoadAllTodosEvent event, Emitter<TodoState> emit) async {
    List<Todo> alltodosDb = await LDB().getTodos();

    emit(TodoState(allTodos: alltodosDb, editableTodo: state.editableTodo));
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    await LDB().insertTodo(event.todo);

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(
        allTodos: List.from(alltodosDb), editableTodo: state.editableTodo));
  }

  void _onDelAllTodo(DeleteAllTodosEvent event, Emitter<TodoState> emit) async {
    await LDB().deleteAllTodo();

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(
        allTodos: List.from(alltodosDb), editableTodo: state.editableTodo));
  }

  void _onUpdateIsDone(UpdateIsDoneEvent event, Emitter<TodoState> emit) async {
    final isDone = event.todo.isDone == 0 ? 1 : 0;

    await LDB().updateTodo(event.todo.copyWith(isDone: isDone));

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(
        allTodos: List.from(alltodosDb), editableTodo: state.editableTodo));
  }

  void _onDelTodo(DeleteTodoEvent event, Emitter<TodoState> emit) async {
    await LDB().deleteTodo(event.todo.id!);

    List<Todo> alltodosDb = await LDB().getTodos();
    emit(TodoState(
        allTodos: List.from(alltodosDb), editableTodo: state.editableTodo));
  }

  void _onCreateEditableTodo(
      CreateEditableTodoEvent event, Emitter<TodoState> emit) {
    emit(TodoState(allTodos: state.allTodos, editableTodo: event.todo));
  }

  void _onUpdateColor(UpdateColorEvent event, Emitter<TodoState> emit) {
    print(event);
    emit(TodoState(allTodos: state.allTodos, editableTodo: event.todo));
  }

  void _onUpdateTitle(UpdateTitleEvent event, Emitter<TodoState> emit) {
    emit(TodoState(allTodos: state.allTodos, editableTodo: event.todo));
  }

  void _onReset(ResetEvent event, Emitter<TodoState> emit) {
    emit(
      TodoState(allTodos: state.allTodos, editableTodo: defaultEditableTodo),
    );
  }
}
