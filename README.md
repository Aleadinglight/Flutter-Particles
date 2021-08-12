# Flutter Particles

A Flutter widget for creating particles.

![Demo](../master/demo_gif/gray.gif)


## Intallation

Add the dependencies needed to your `pubspec.yaml` file.

## Usage

Import the file

```dart
import 'package:flutter_particles/particles.dart';
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

Personalize particles in depth

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.orange[50],
      body: new Particles(
        30, // Number of Particles
        Colors.blue, // Color of Particles
        particleSize: 5.0, //Size of Particles
        strokeSize: 4.0, //Size of stroke between particles
        connectDistance: 50.0, //Distance between particles to connect
        minSpeed: 2, //Minimum speed of a particle
        maxSpeed: 5, //Maximum speed of a particle
      ),
    );
  }
}
```

## Demo

![Demo](../master/demo_gif/red.gif)
![Demo](../master/demo_gif/blueyellow.gif)