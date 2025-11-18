import 'package:block_equatable_sample/controller/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is Productloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Productloaded) {
            return ListView.builder(
              itemCount: state.plist!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      '${state.plist![index].thumbnail}',
                    ),
                  ),
                  title: Text("${state.plist![index].title}"),
                );
              },
            );
          } else if (state is ProductLoadingError) {
            return Center(child: Text("${state.errormessage}"));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
