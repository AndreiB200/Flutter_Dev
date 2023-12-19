// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/room_info/room_info.dart';
//import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RoomInfo> roomInfos = [
    RoomInfo(
        temperatureInside: 19,
        humidity: 13,
        temperatureOutside: 29,
        asset: 'living_room.jpg'),
    RoomInfo(
        temperatureInside: 10,
        humidity: 75,
        temperatureOutside: 31,
        asset: 'bathroom.jpg'),
    RoomInfo(
        temperatureInside: 39,
        humidity: 62,
        temperatureOutside: 32,
        asset: 'kitchen.jpg'),
    RoomInfo(
        temperatureInside: 23,
        humidity: 27,
        temperatureOutside: 30,
        asset: 'bedroom.jpg'),
    RoomInfo(
        temperatureInside: 27,
        humidity: 13,
        temperatureOutside: 31,
        asset: 'bedroom.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Select Room',
            style: GoogleFonts.roboto(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: Color.fromARGB(255, 226, 219, 219),
              letterSpacing: 3,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 2, 0),
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            SizedBox(height: 20),
            Image(
              width: 350,
              height: 350,
              image: AssetImage('assets/magic_house.png'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 225, 255, 205),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 100, 100, 100),
                          Color.fromARGB(255, 31, 31, 31),
                        ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 112, 112, 112),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: ListView(
                  padding: EdgeInsets.all(4),
                  children: [
                    RoomWidget(roomInfo: roomInfos[0]),
                    RoomWidget(roomInfo: roomInfos[1]),
                    RoomWidget(roomInfo: roomInfos[2]),
                    RoomWidget(roomInfo: roomInfos[3]),
                    RoomWidget(roomInfo: roomInfos[4]),
                  ],
                ),
              ),
            ),
          ],
        ))));
  }
}

/*Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoomWidget(),
                    SizedBox(height: 12.0),
                    RoomWidget(),
                    SizedBox(height: 12.0),
                    RoomWidget(),
                  ],
                ),*/

class RoomWidget extends StatefulWidget {
  final RoomInfo roomInfo;

  @override
  State<RoomWidget> createState() => _RoomWidgetState();

  const RoomWidget({Key? key, required this.roomInfo}) : super(key: key);
}

class _RoomWidgetState extends State<RoomWidget> {
  final Color insideCardColor = Colors.white;

  void iterate() {
    setState(() {
      print("it works");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(height: 10),
        Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.roomInfo.asset),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 87, 87, 87), BlendMode.multiply),
                ),
                color: Color.fromARGB(255, 192, 192, 192),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 43, 43, 43),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 1),
                  )
                ]),
            child: InkWell(
              onTap: iterate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.device_thermostat,
                          size: 50,
                          color: insideCardColor,
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: Text('Thermostat',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: insideCardColor,
                              ))),
                      Expanded(
                          child: Text('${widget.roomInfo.temperatureInside}',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                color: insideCardColor,
                              ))),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.water_drop_outlined,
                        size: 50,
                        color: insideCardColor,
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: Text('Air humidity',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: insideCardColor,
                            ))),
                    Expanded(
                        child: Text('${widget.roomInfo.temperatureInside}%',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: insideCardColor,
                            ))),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.outdoor_grill,
                        size: 50,
                        color: insideCardColor,
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: Text('Outside temp',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: insideCardColor,
                            ))),
                    Expanded(
                        child: Text('${widget.roomInfo.temperatureOutside}',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: insideCardColor,
                            ))),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
