import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firefly/bloc/fly_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LiveView extends StatefulWidget {
  const LiveView({super.key});

  @override
  State<StatefulWidget> createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  late DatabaseReference _dbref;
  var gasPPM;
  var fire;
  var gas;

  void realData() {
    _dbref.child("Sensors").onValue.listen((event) {
      Map data = event.snapshot.value as Map;
      data.forEach((key, value) {
        setState(() {
          gasPPM = data["Gas PPM"];
          fire = data["fire"];
          gas = data["gas"];
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
    realData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlyBloc, FlyState>(
      builder: (context, state) {
        if (fire == true) {
          http.post(
              Uri.parse(
                  'https://app.nativenotify.com/api/flutter/notification'),
              headers: {HttpHeaders.contentTypeHeader: 'application/json'},
              body: jsonEncode({
                HttpHeaders.contentTypeHeader: 'application/json',
                'flutterAppId': '2029',
                'flutterAppToken': 'or2I21PTBmSwm7h0JqiyHN',
                'title': 'FIRE!',
                'body': 'Fire has been detected!',
                'bigPictureURL': null,
                'data': '{ "yourProperty":"yourPropertyValue" }',
              }));
        }
        return Center(
          child: Column(
            children: [
              fire == true
                  ? const Icon(Icons.local_fire_department,
                      color: Colors.orange, size: 150)
                  : gas == true
                      ? const Icon(Icons.cloud, color: Colors.green, size: 150)
                      : const Icon(Icons.health_and_safety,
                          color: Colors.green, size: 150),
              Text(
                fire == true ? "Fire Detected" : "Safe",
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              gasPPM != null
                  ? SfRadialGauge(
                      animationDuration: 1000,
                      axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 500,
                            labelOffset: 50,
                            axisLineStyle: AxisLineStyle(
                                thicknessUnit: GaugeSizeUnit.factor,
                                thickness: 0.03),
                            majorTickStyle: MajorTickStyle(
                                length: 6, thickness: 4, color: Colors.white),
                            minorTickStyle: MinorTickStyle(
                                length: 3, thickness: 3, color: Colors.white),
                            axisLabelStyle: GaugeTextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 500,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  startWidth: 0.03,
                                  endWidth: 0.03,
                                  gradient: SweepGradient(colors: const <Color>[
                                    Colors.green,
                                    Colors.orange,
                                    Colors.red
                                  ], stops: const <double>[
                                    0.0,
                                    0.5,
                                    1
                                  ]))
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                  value: gasPPM.toDouble(),
                                  needleLength: 0.95,
                                  enableAnimation: true,
                                  animationType: AnimationType.ease,
                                  needleStartWidth: 1.5,
                                  needleEndWidth: 6,
                                  needleColor: Colors.red,
                                  knobStyle: KnobStyle(
                                      knobRadius: 0.09, color: Colors.grey))
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Container(
                                      child: Column(children: <Widget>[
                                    Text(gasPPM.toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    SizedBox(height: 20),
                                    Text('PPM',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))
                                  ])),
                                  angle: 90,
                                  positionFactor: 1.5)
                            ]),
                      ],
                    )
                  : CircularProgressIndicator()
            ],
          ),
        );
      },
    );
  }
}
