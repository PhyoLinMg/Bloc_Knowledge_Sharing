import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_knowledge_sharing/network/network.dart';
import 'package:bloc_knowledge_sharing/repository/repository.dart';
import 'package:bloc_knowledge_sharing/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_knowledge_sharing/bloc/bloc.dart';

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
    return DynamicTheme(
      defaultBrightness: Brightness.dark,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: brightness
      ),
      themedWidgetBuilder: (context,theme){
          return MaterialApp(
      title: 'Flutter Bloc',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Periods'),
          actions: <Widget>[
                IconButton(icon: Icon(Icons.settings), onPressed: (){
                  // Navigator.push(context,MaterialPageRoute(builder: (context) => Settings()));
               })
          ],
        ),
        body: BlocProvider(
          create: (context) =>
          PeriodBloc(service: MainService(httpClient: http.Client()))..add(PeriodFetch()),
          child: HomePage(),
        ),
      ),
    );
      },
    );
  }
}






