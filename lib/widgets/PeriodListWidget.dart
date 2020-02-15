import 'package:flutter/material.dart';

import '../models/models.dart';

class PeriodListWidget extends StatelessWidget {
  final Data data;

  const PeriodListWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${data.subject_id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(data.major_name),
      isThreeLine: true,
      subtitle: Text("${data.start_time}-${data.end_time}"),
      dense: true,
    );
  }
}