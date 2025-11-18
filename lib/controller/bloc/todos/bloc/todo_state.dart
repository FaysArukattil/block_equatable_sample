// ignore_for_file: must_be_immutable

part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class Todoloading extends TodoState {
  const Todoloading();

  @override
  List<Object> get props => [];
}

final class Todoloaded extends TodoState {
  List<Todos>? list;

  Todoloaded(this.list);

  @override
  List<Object> get props => [list!];
}

final class TodoError extends TodoState {
  String? message;
  TodoError(this.message);

  @override
  List<Object> get props => [message!];
}
