# Flutter Particles

A Flutter widget for creating particles.

![Demo](../master/demo_gif/original.gif)

## Intallation

Add the dependencies needed to your `pubspec.yaml` file.

## Usage

Import the file

```dart
import 'package:particle/particles.dart';
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
![Demo](../master/demo_gif/white_blue.gif)