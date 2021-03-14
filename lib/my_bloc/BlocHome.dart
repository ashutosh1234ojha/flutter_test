import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/my_bloc/bloc/todo_bloc.dart';

import 'ShimmerWidget.dart';
import 'TodoModel.dart';

class BlocHome extends StatefulWidget {
  @override
  _BlocHomeState createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  List<TodoModel> coinModelList = [];
  TodoBloc mBloc;

  @override
  void initState() {
    super.initState();
    mBloc = BlocProvider.of<TodoBloc>(context);
    mBloc.add(RequestTodoApiClient());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I did it'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
          builder: (BuildContext context, state) {
        if (state is TodoInitial) {
          // return buildLoadingState();
          return ShimmerWidget();
        } else if (state is RequestApiLoading) {
          // return buildLoadingState();
          return ShimmerWidget();
        } else if (state is TodoApiError) {
          return Text("No Data Found..");
        } else if (state is TodoApiSuccess) {

          return ListView.builder(
              itemCount: coinModelList.length,
              itemBuilder: (context, index) {
                if (state is TodoApiSuccess) {
                  if (state.coinModel.length == 0) {
                    return Text("No Data Found..");
                  } else {
                    return Text(state.coinModel[index].title);
                  }
                } else {
                  return Text("No Data Found..");
                }
              });
        } else {
          return Text("No Data Found..");
        }

      }, listener: (BuildContext context, state) {
        if (state is RequestApiLoading) {
        } else if (state is TodoApiError) {
          final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (state is TodoApiSuccess) {
          coinModelList = state.coinModel;
        }
      }),
    );
  }

  Widget buildLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
