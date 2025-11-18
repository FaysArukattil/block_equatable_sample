import 'package:block_equatable_sample/controller/bloc/products/bloc/product_bloc.dart';
import 'package:block_equatable_sample/controller/bloc/todos/bloc/todo_bloc.dart';
import 'package:block_equatable_sample/views/productlistview.dart';
import 'package:block_equatable_sample/views/todolistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc()..add(Fetch())),
        BlocProvider(create: (context) => TodoBloc()..add(FetchTodo())),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Todolistview());
  }
}
