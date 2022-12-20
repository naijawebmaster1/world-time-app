import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:my_world_app/constants.dart';

class WorldTime {
  late String location; // location name for UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // try{
    //   // make the request
    //   // Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    //   // Response response = await Uri.https('example.com', 'whatsit/create')
    //
    //   var url = Uri.https('http://worldtimeapi.org/api/timezone', 'whatsit/create');
    //   var response = await http.get(url, body: {'name': 'doodle', 'color': 'blue'});
    //
    //
    //   Map data = jsonDecode(response.body);
    //
    //   // get properties from json
    //   String datetime = data['datetime'];
    //   String offset = data['utc_offset'].substring(1,3);
    //
    //   // create DateTime object
    //   DateTime now = DateTime.parse(datetime);
    //   now = now.add(Duration(hours: int.parse(offset)));
    //
    //   // set the time property
    //   isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    //   time = DateFormat.jm().format(now);
    // }
    // catch (e) {
    //   // print(e);
    //   time = 'could not get time';
    // }

    // try {
    // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
    // var response = await http.get(url);
    // if (response.statusCode == 200) {
    //
    //   debugPrint(response);

    //
    //
    // Map data = jsonDecode(response.body);
    //
    // // get properties from json
    // String datetime = data['datetime'];
    // String offset = data['utc_offset'].substring(1,3);
    //
    // // create DateTime object
    // DateTime now = DateTime.parse(datetime);
    // now = now.add(Duration(hours: int.parse(offset)));
    //
    // // set the time property
    // isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    // time = DateFormat.jm().format(now);
    // log("e.toString()");

    // }

    try {
      // var url = Uri.https('my-json-server.typicode.com/flutterdata/demo/tasks', 'whatsit/create');
      // var url = Uri.https("my-json-server.typicode.com", "/flutterdata/demo/tasks");
      // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var myUrl = Uri.parse('http://worldtimeapi.org/api/timezone/$url');

      http: //worldtimeapi.org/api/timezone/$url'
      if (kDebugMode) {
        print(url);
      }

      var response = await http.get(myUrl);
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      // debugPrint(await http.read(Uri.https('example.com', 'foobar.txt')));

      if (kDebugMode) {
        print(response.body);
      }

      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      log(e.toString());
    }
  }
}
