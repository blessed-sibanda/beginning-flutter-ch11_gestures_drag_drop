import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures & Drag and Drop'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildGestureDetector(),
              const Divider(color: Colors.black, height: 44.0),
              _buildDraggable(),
              const Divider(height: 40.0),
              _buildDragTarget(),
              const Divider(color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() => _gestureDetected = gesture);
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      // onVerticalDragUpdate: ((DragUpdateDetails details) {
      //   print('onVerticalDragUpdate: $details');
      //   _displayGestureDetected('onVerticalDragUpdate:\n$details');
      // }),
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print('onHorizontalDragUpdate: $details');
        _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        print('onHorizontalDragEnd: $details');
        if (details.primaryVelocity! < 0) {
          print('Dragging Right to Left: ${details.velocity}');
        } else if (details.primaryVelocity! > 0) {
          print('Dragging Left to Right: ${details.velocity}');
        }
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.access_alarm, size: 98.0),
            Text(_gestureDetected),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggable() {
    return Container();
  }

  Widget _buildDragTarget() {
    return Container();
  }
}
