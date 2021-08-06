import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  Duration duration = Duration(seconds: 1000);
  Duration duration1 = Duration(seconds: 3);
  Duration duration2 = Duration(seconds: 200);

  BehaviorSubject<DateTime> timeStream = BehaviorSubject<DateTime>();
  BehaviorSubject<DateTime> timeStream1 = BehaviorSubject<DateTime>();
  BehaviorSubject<DateTime> timeStream2 = BehaviorSubject<DateTime>();
  // BehaviorSubject<DateTime>? timeStream2;
  // BehaviorSubject<DateTime>? timeStream3;
  GlobalBloc() {
    final initStream =
        Stream<DateTime>.periodic(Duration(milliseconds: 1000), (_) {
      DateTime time = DateTime.now();
      duration -= Duration(seconds: 1);
      print("Timer 1 : $time , Remaining Duration   : ${duration.inSeconds}");
      return time;
    });
    final initStream1 =
        Stream<DateTime>.periodic(Duration(milliseconds: 1000), (_) {
      DateTime time = DateTime.now();
      duration1 -= Duration(seconds: 1);
      if (duration1.inSeconds == 0) {
        Future.delayed(Duration(milliseconds: 1000), () {
          //
        });
      }
      print("Timer 2 : $time , Remaining Duration 1 : ${duration1.inSeconds}");
      return time;
    });
    final initStream2 =
        Stream<DateTime>.periodic(Duration(milliseconds: 1000), (_) {
      DateTime time = DateTime.now();
      duration2 -= Duration(seconds: 1);
      if (duration2.inSeconds == 0) {
        Future.delayed(Duration(milliseconds: 1000), () {
          //
        });
      }
      print("Timer 3 : $time , Remaining Duration 2 : ${duration2.inSeconds}");
      return time;
    });
    timeStream.addStream(initStream);
    timeStream1.addStream(initStream1);
    timeStream2.addStream(initStream2);
  }
}

final globalBloc = GlobalBloc();
