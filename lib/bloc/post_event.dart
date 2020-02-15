import 'package:equatable/equatable.dart';

abstract class PeriodEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PeriodFetch extends PeriodEvent {}
