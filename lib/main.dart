import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: RotatedLogo(size: 200)),
    );
  }
}

class RotatedLogo extends StatefulWidget {
  const RotatedLogo({
    Key? key,
    this.size = 50,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);
  final double size;
  final Duration duration;
  @override
  _RotatedLogoState createState() => _RotatedLogoState();
}

class _RotatedLogoState extends State<RotatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      /// repeat を呼ぶだけ
      turns: controller..repeat(),
      child: const Text(
        "aaa",
        style: TextStyle(
          fontSize: 200,
        ),
      ),
    );
  }
}
