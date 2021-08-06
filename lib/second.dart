import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:slider_countdown_example/global_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late StreamSubscription<DateTime> sub;
  late StreamSubscription<DateTime> sub1;
  late StreamSubscription<DateTime> sub2;

  @override
  void initState() {
    sub = globalBloc.timeStream.listen((event) {}); //Any locgic?
    sub1 = globalBloc.timeStream1.listen((event) {});
    sub2 = globalBloc.timeStream2.listen((event) {});
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    sub1.cancel();
    sub2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMERS"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Slide direction Up'),
            SlideCountdownClock(
              duration: globalBloc.duration,
              slideDirection: SlideDirection.Up,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shouldShowDays: true,
            ),
            _buildSpace(),
            Text('Slide direction Down'),
            SlideCountdownClock(
              duration: globalBloc.duration1,
              slideDirection: SlideDirection.Down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildSpace(),
            Text('Use box Decoration'),
            Padding(
              padding: EdgeInsets.all(10),
              child: SlideCountdownClock(
                duration: globalBloc.duration2,
                slideDirection: SlideDirection.Up,
                separator: "-",
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                separatorTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                padding: EdgeInsets.all(10),
                decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return SizedBox(height: 50);
  }
}
