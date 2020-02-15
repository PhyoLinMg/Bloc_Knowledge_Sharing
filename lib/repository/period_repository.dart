import 'dart:async';

import 'package:flutter_infinite_list/models/periods.dart';
import 'package:flutter_infinite_list/network/network.dart';
import 'package:meta/meta.dart';


class PeriodRepository {
  final MainService mainService;

  PeriodRepository({@required this.mainService})
      : assert(mainService != null);

  Future<Periods> getPeriods() async {

    return mainService.fetchPosts();
  }
}