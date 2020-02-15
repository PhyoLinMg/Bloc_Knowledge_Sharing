import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_infinite_list/network/network.dart';
import 'package:flutter_infinite_list/repository/repository.dart';
import 'package:flutter_infinite_list/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/bloc/bloc.dart';

void main() {
  final PeriodRepository repository=PeriodRepository(mainService: MainService(httpClient: http.Client()));
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App(repository:repository));
}

class App extends StatelessWidget {
  final PeriodRepository repository;
  App({Key key,@required this.repository}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Periods'),
        ),
        body: BlocProvider(
          create: (context) =>
          PeriodBloc(service: MainService(httpClient: http.Client()))..add(PeriodFetch()),
          child: HomePage(),
        ),
      ),
    );
  }
}






