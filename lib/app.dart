import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_multi_bloc/logger_bloc/logger_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CounterBloc()..add(CounterIncrementEvent()),
            ),
            BlocProvider(
              create: (context) => LoggerBloc()..add(InitialEvent()),
            ),
          ],
          child: Container(
            child: BlocListener<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterLoaded) {
                  print('state');
                }
              },
              child: BlocListener<LoggerBloc, LoggerState>(
                listener: (context, state) {
                  if (state is LoggerInitial) {
                    print('logger state');
                  }
                },
                child: Text('aaaa'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
