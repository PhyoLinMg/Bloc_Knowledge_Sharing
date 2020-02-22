import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_infinite_list/network/network.dart';
import 'package:flutter_infinite_list/repository/repository.dart';
import 'package:flutter_infinite_list/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        drawer:Drawer(
      child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: DrawerHeader(
                  child: Text("Header"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                      Fluttertoast.showToast(
                            msg: "This is Home",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.cyanAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                  },
                ),
                ListTile(
                  title: Text("Peroids"),
                  onTap: () {
                    Fluttertoast.showToast(
                            msg: "This is Periods",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.cyanAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                  },
                ),
                ListTile(
                  title: Text("Subjects"),
                  onTap: () {
                     Fluttertoast.showToast(
                            msg: "This is Subjects",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.cyanAccent,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ]),
            )
          ],
        ),
  )
        ,
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






