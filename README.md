# Flutter Particles

A Flutter widget for creating particles.

<img src="https://github.com/Aleadinglight/Flutter-Particle/blob/master/demo_gif/original.gif" width="250" />

## Intallation

Add the dependencies needed to your `pubspec.yaml` file.

## Usage

Import the file

```dart
import 'package:particles/particles.dart';
```

Calling the widget

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange[50],
      body: new Particles(
        30, // Number of Particles
        Colors.blue, // Color of Particles
      ),
    );
  }
}
```

## Demo

![Demo](../master/demo_gif/red.gif)
![Demo](../master/demo_gif/yellow.gif)