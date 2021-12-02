import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _gestureDetected;

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
    );
  }

  Widget _buildDraggable() {
    return Container();
  }

  Widget _buildDragTarget() {
    return Container();
  }
}
