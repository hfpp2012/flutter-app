import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(2, 3);

    DateTime now =
        DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }
}
