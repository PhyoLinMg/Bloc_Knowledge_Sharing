
class Data {

  int subject_id;
  String subject_name;
  int major_id;
  String major_name;
  String start_time;
  String end_time;

	Data.fromJsonMap(Map<String, dynamic> map): 
		subject_id = map["subject_id"],
		subject_name = map["subject_name"],
		major_id = map["major_id"],
		major_name = map["major_name"],
		start_time = map["start_time"],
		end_time = map["end_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subject_id'] = subject_id;
		data['subject_name'] = subject_name;
		data['major_id'] = major_id;
		data['major_name'] = major_name;
		data['start_time'] = start_time;
		data['end_time'] = end_time;
		return data;
	}
}
