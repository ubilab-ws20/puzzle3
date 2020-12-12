import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:ubilab_scavenger_hunt/puzzle_base/puzzleBase.dart';
import 'package:flutter/services.dart';

import '../puzzle_base/puzzleBase.dart';

class Puzzle3 extends PuzzleBase {
  LatLng getStartLocation() {
    return LatLng(48.012684, 7.835044);
  }
  List<String> getIntroTexts() {
    return ["Intro 1", "Intro 2", "Intro 3"];
  }
  List<String> getOutroTexts() {
    return ["Outro 1", "Outro 2", "Outro 3"];
  }
  void startPuzzle(BuildContext context) {
    print("Puzzle 3 started!");
    Navigator.push(context, MaterialPageRoute(builder: (context) => FirstRoute()));
    this.onFinished();
  }

}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('We move under cover and we move as one', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Through the night, we have one shot to live another day', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('We cannot let a stray gunshot give us away', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('We will fight up close, seize the moment and stay in it', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('It’s either that or meet the business end of a bayonet', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('The code word is ‘Rochambeau,’ dig me?', style: TextStyle(fontWeight: FontWeight.bold)),
              ElevatedButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ]
        ),
      ),
    );
  }
}
double _volume = 0.0;
class SecondRoute extends StatefulWidget {

  SecondRoute({
    Key key,
    this.parameter,
  }): super(key: key);
  final parameter;
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class ThirdRoute extends StatefulWidget {

  ThirdRoute({
    Key key,
    this.parameter,
  }): super(key: key);
  final parameter;
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Insert outro here', style: TextStyle(fontWeight: FontWeight.bold)),
              ElevatedButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ]
        ),
      ),

    );
  }

}

double x0 = 50, y0 = 150, x1 = 600, y1 = 150, x2 = 350, y2 = 50, x3 = 150, y3 = 50, x4 = 153, y4 = 103, x5 = 239 , y5 = 240, x6 = 135, y6 = 201, x7 = 400, y7 = 250, x8 = 489, y8 = 105, x9 = 350, y9 = 189;

class _SecondRouteState extends State<SecondRoute > {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;
  int lastNode = 0;
  Color c1 = Colors.blue;
  Color c2 = Colors.blue;

  void _incrementDown(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _downCounter++;
    });
  }

  void _incrementUp(PointerEvent details) {
    _updateLocation(details);
    setState(() {
      _upCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    double X = details.position.dx;
    double Y = details.position.dy;
    setState(() {
      x = X;
      y = Y;
    });
    if (X > x0+15 && X < x0+30 && Y > y0+95 && Y < y0+110 && lastNode == 0) {
        lastNode = 1;
        c1 = Colors.green;
        print("first node");
    }
    if (X > x1+15 && X < x1+30 && Y > y1+95 && Y < y1+110 && lastNode == 1) {
      lastNode = 2;
      c2 = Colors.green;
      print("second node");
    }
  }

  @override
  void initState(){
    super.initState();
    // Additional initialization of the State
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    // Additional code
  }
  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Stack(
        children: <Widget>[
          CustomPaint( //                       <-- CustomPaint widget
              size: Size(1000, 1000),
              painter: MyPainter()
          ),
          Positioned(
            top: y1,
            left: x1,
            child: Column(
              children: <Widget>[
            IconButton(
              icon: Icon(Icons.circle),
              color: c2,
              onPressed: () {
              },
            ),
              Text("End")
              ]),),
          Positioned(
            top: y0,
            left: x0,
            child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.circle),
                    color: c1,
                    onPressed: () {
                    },
                  ),
                  Text("Start")
                ]),),
          Positioned(
            top: y2,
            left: x2,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y3,
            left: x3,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y4,
            left: x4,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y5,
            left: x5,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y6,
            left: x6,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y7,
            left: x7,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y8,
            left: x8,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          Positioned(
            top: y9,
            left: x9,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: c1,
              onPressed: () {
              },
            ),),
          ConstrainedBox(
            constraints: BoxConstraints.tight(Size(1000.0, 1000.0)),
            child: Listener(
              onPointerDown: _incrementDown,
              onPointerMove: _updateLocation,
              onPointerUp: _incrementUp,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                    ),
                  ],
                ),
              ),
            ),),
        ]),
    );
  }
}


class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
    void paint(Canvas canvas, Size size) {
      final p0 = Offset(x0+25, y0+25);
      final p1 = Offset(x1+25, y1+25);
      final p2 = Offset(x2+25, y2+25);
      final p3 = Offset(x3+25, y3+25);
      final p4 = Offset(x4+25, y4+25);
      final p5 = Offset(x5+25, y5+25);
      final p6 = Offset(x6+25, y6+25);
      final p7 = Offset(x7+25, y7+25);
      final p8 = Offset(x8+25, y8+25);
      final p9 = Offset(x9+25, y9+25);
      final paint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 4;
      canvas.drawLine(p0, p1, paint);
      canvas.drawLine(p1, p2, paint);
      canvas.drawLine(p2, p3, paint);
      canvas.drawLine(p3, p4, paint);
      canvas.drawLine(p4, p5, paint);
      canvas.drawLine(p5, p6, paint);
      canvas.drawLine(p6, p7, paint);
      canvas.drawLine(p7, p8, paint);
      canvas.drawLine(p8, p9, paint);
      canvas.drawLine(p0, p9, paint);
      canvas.drawLine(p0, p6, paint);

    }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}


