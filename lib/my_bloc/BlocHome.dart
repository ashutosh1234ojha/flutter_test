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
 //   mBloc.add(LoadingEvent());
    // mBloc.add(LoadingEvent());
     mBloc.add(RequestTodoApiClient());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I did it'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
          listener: (BuildContext context, state) {
        if (state is ScreenLoading) {
          mBloc.add(LoadingEvent());
        } else if (state is LoadingEvent) {
          mBloc.add(RequestTodoApiClient());
        } else if (state is TodoApiSuccess) {
          coinModelList = state.coinModel;
        } else if (state is TodoApiError) {
          final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
          Scaffold.of(context).showSnackBar(snackBar);
        }
      }, builder: (BuildContext context, state) {
        return Container(
            child: ListView.builder(
                itemCount: coinModelList.length,
                itemBuilder: (context, index) {
                  if (state is ScreenLoading) return ShimmerWidget();
                  if (state is LoadingEvent) return ShimmerWidget();
                  if (state is RequestApiLoading) return ShimmerWidget();
                  if (coinModelList.length == 0) return Text("No Data Found..");
                  TodoModel localCoinModel = coinModelList[index];
                  if (state is TodoApiError)
                    return Text("No Data Found.."); //ShimmerWidget()
                  else
                    return Text(coinModelList[index].title);
                }));
      }),
    );
  }
}
