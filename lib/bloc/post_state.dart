import 'package:equatable/equatable.dart';

import 'package:bloc_knowledge_sharing/models/models.dart';

abstract class PeriodState extends Equatable {
  const PeriodState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PeriodState {}

class PostError extends PeriodState {}

class PostLoaded extends PeriodState {
  final Periods periods;

  const PostLoaded({
    this.periods,
  });



  @override
  List<Object> get props => [periods];


}
