import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location = '';       //Location name for UI
  String time = '';           //The time in that location
  String flag = '';           //url to asset flag icon
  String url = '';       //location url for api endpoint
  bool isDayTime = false;
  String period = 'night';
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      //Get Properties from Data
      String dateTime = data['datetime'];
      String offset_hours = data['utc_offset'].substring(1,3);
      String offset_min = data['utc_offset'].substring(4,);

      // print(dateTime);
      print(data['utc_offset']);
      // print(offset_min);

      //create a datetime object
      DateTime now = DateTime.parse(dateTime);
      // print(now);
      if(data['utc_offset'][0]=='+')
        now = now.add(Duration(hours:int.parse(offset_hours),minutes: int.parse(offset_min)));
      else{
        now = now.subtract(Duration(hours:int.parse(offset_hours),minutes: int.parse(offset_min)));
      }
      // print(now);
      isDayTime = now.hour>=4 && now.hour<19? true:false;

      if(now.hour>11 && now.hour<=16){
        period = 'afternoon';
      }

      else if(now.hour>16 && now.hour<=19)
        period = 'evening';
      else if(now.hour>=6 && now.hour<=11)
        period = 'morning';
      // print(now);
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time = 'null';
      // print(e);
    }
  }

}