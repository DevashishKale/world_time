

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  @override
  Widget build(BuildContext context) {
    //

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);

    String bgImg = 'night.jpg';
    Color? bgColor = Colors.indigo[400];
    // String bgImg = data['isDayTime'] ? 'day.png' : 'night.png';
    if(data['period']=='afternoon'){
      bgImg = 'afternoon.jpg';
      bgColor = Colors.indigo[400];
    }
    else if(data['period']=='evening'){
      bgImg = 'evening.jpg';
      bgColor = Colors.teal[700];
    }

    else if(data['period']=='morning'){
      bgImg = 'morning.jpg';
      bgColor = Colors.orange[800];
    }


    // Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    // print(data['isDayTime']);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/homeImg/$bgImg'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  // TextButton.icon(
                  //     onPressed: () async {
                  //       dynamic result = await Navigator.pushNamed(context, '/location');
                  //         print(result);
                  //         setState(() {
                  //           data = result;
                  //         });
                  //
                  //   },
                  //     icon: Icon(
                  //         Icons.edit_location,
                  //         color: Colors.grey[300],
                  //     ),
                  //     label: Text(
                  //         'Edit Location',
                  //         style: TextStyle(color: Colors.grey[300]),
                  //     ),
                  // ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  data['time'] != 'null' ? Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ) : Text(
                    'Couldnt connect to network',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 300.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(270,100,0,0),
                    child: RawMaterialButton(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(
                            context, '/location');
                        // print(result);
                        setState(() {
                          data = result;
                        });
                      },
                      elevation: 2.0,
                      fillColor: Colors.green,
                      child: Icon(
                        Icons.location_on,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),


      ),

    );
  }
}
