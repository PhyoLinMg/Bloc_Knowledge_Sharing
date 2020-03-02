import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_knowledge_sharing/widgets/PeriodListWidget.dart';

import '../bloc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeriodBloc, PeriodState>(
      builder: (context, state) {
        if (state is PostError) {
          return Center(
            child: Text('failed to fetch periods'),
          );
        }
        if (state is PostLoaded) {
          if (state.periods.data.isEmpty) {
            return Center(
              child: Text('no periods'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new PeriodListWidget(data: state.periods.data[index]);
            },
            itemCount: state.periods.data.length,

          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}