import 'package:flutter_infinite_list/models/data.dart';

class Periods {

  List<Data> data;

	Periods.fromJsonMap(Map<String, dynamic> map): 
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
