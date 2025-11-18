import 'package:block_equatable_sample/controller/bloc/todos/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todolistview extends StatelessWidget {
  const Todolistview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is Todoloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Todoloaded) {
            return ListView.builder(
              itemCount: state.list!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${state.list![index].id}"),
                  ),
                  trailing: Text(state.list![index].completed.toString()),
                  title: Text("${state.list![index].todo}"),
                  subtitle: Text("${state.list![index].userId}"),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(child: Text("${state.message}"));
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
