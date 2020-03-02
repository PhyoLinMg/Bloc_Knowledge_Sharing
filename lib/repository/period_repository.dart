import 'dart:async';

import 'package:bloc_knowledge_sharing/models/periods.dart';
import 'package:bloc_knowledge_sharing/network/network.dart';
import 'package:meta/meta.dart';


class PeriodRepository {
  final MainService mainService;

  PeriodRepository({@required this.mainService})
      : assert(mainService != null);

  Future<Periods> getPeriods() async {

    return mainService.fetchPosts();
  }
}