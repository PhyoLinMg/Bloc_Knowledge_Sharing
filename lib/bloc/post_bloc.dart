import 'dart:async';
import 'package:flutter_infinite_list/network/MainService.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_infinite_list/bloc/bloc.dart';


class PeriodBloc extends Bloc<PeriodEvent, PeriodState> {
  final MainService service;

  PeriodBloc({@required this.service});

  @override
  Stream<PeriodState> transformEvents(
    Stream<PeriodEvent> events,
    Stream<PeriodState> Function(PeriodEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PostUninitialized();

  @override
  Stream<PeriodState> mapEventToState(PeriodEvent event) async* {
    final currentState = state;
    if (event is PeriodFetch) {
      try {
        if (currentState is PostUninitialized) {
          final periods = await service.fetchPosts();
          yield PostLoaded(periods: periods);
          return;
        }

      } catch (_) {
        yield PostError();
      }
    }
  }




}
