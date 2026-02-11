import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BackdropFilterDemo());
  }
}

class BackdropFilterDemo extends StatefulWidget {
  const BackdropFilterDemo({super.key});

  @override
  State<BackdropFilterDemo> createState() => _BackdropFilterDemoState();
}

class _BackdropFilterDemoState extends State<BackdropFilterDemo> {
  bool _showPanel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BackdropFilter Demo')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          Image.network(
            'https://cdn.pixabay.com/photo/2024/08/26/05/20/ai-generated-8998175_640.jpg',
            fit: BoxFit.cover,
          ),
          // Frosted glass panel (shown when button is pressed)
          if (_showPanel)
            Center(
              child: ClipRect(
                // BackdropFilter: creates frosted glass effect by blurring content behind it
                child: BackdropFilter(
                  // PROPERTY 1: filter - defines the blur effect
                  // sigmaX and sigmaY control blur intensity (higher = more blur)
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  // PROPERTY 2: blendMode - how the blur blends with background
                  // srcOver is default (normal overlay), other options: multiply, screen, overlay
                  blendMode: BlendMode.srcOver,
                  // PROPERTY 3: child - widget displayed on top of blurred background
                  child: Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Blurry Glass',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showPanel = !_showPanel;
          });
        },
        child: Icon(_showPanel ? Icons.close : Icons.blur_on),
      ),
    );
  }
}
