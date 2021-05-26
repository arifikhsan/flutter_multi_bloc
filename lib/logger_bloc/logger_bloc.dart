import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logger_event.dart';
part 'logger_state.dart';

class LoggerBloc extends Bloc<LoggerEvent, LoggerState> {
  LoggerBloc() : super(LoggerInitial());

  @override
  Stream<LoggerState> mapEventToState(
    LoggerEvent event,
  ) async* {
    if (event is InitialEvent) {
      yield LoggerInitial();
    }
  }
}
