import 'package:bloc/bloc.dart';
import 'package:block_equatable_sample/models/resptodoall.dart';
import 'package:block_equatable_sample/services/apiservice.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(Todoloading()) {
    ApiService apiService = ApiService();
    on<FetchTodo>((event, emit) async {
      emit(Todoloading());

      try {
        var todos = await apiService.loadtodo();
        emit(Todoloaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
