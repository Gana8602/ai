import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'overlay_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _showOverlay() async {
    if (await FlutterOverlayWindow.isPermissionGranted()) {
      await FlutterOverlayWindow.showOverlay(
        height: 100,
        width: 100,
        alignment: OverlayAlignment.center,
        enableDrag: true,
      );
    } else {
      await FlutterOverlayWindow.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Assistant'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showOverlay,
          child: Text('Show Overlay'),
        ),
      ),
    );
  }
}
