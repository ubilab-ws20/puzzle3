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
class _SecondRouteState extends State<SecondRoute > {
  int _downCounter = 0;
  int _upCounter = 0;
  double x = 0.0;
  double y = 0.0;
  int lastNode = 0;
  Color c1 = Colors.blue;

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
    if (X > 215 && X < 230 && Y > 245 && Y < 260 && lastNode == 0) {
        lastNode = 1;
        c1 = Colors.amber;
        print("first node");
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
        title: Text("Find longest path!"),
      ),
      body: Stack(
        children: <Widget>[
          CustomPaint( //                       <-- CustomPaint widget
              size: Size(1000, 1000),
              painter: MyPainter()
          ),
          Positioned(
            top: 150,
            left: 500,
            child: IconButton(
              icon: Icon(Icons.circle),
              color: Colors.blue,
              onPressed: () {
              },
            ),),
          Positioned(
            top: 150,
            left: 200,
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
      final p1 = Offset(225, 175);
      final p2 = Offset(525, 175);
      final paint = Paint()
        ..color = Colors.blue
        ..strokeWidth = 4;
      canvas.drawLine(p1, p2, paint);
    }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}


