import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Cameras extends StatefulWidget {
  const Cameras({super.key});

  @override
  State<Cameras> createState() => _CamerasState();
}

class _CamerasState extends State<Cameras> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
                spawnMaxRadius: 40,
                spawnMinSpeed: 15,
                particleCount: 80,
                spawnMaxSpeed: 40,
                baseColor: Colors.black)),
        child: Center(
          child: Text("data"),
        ),
      ),
    );
  }
}
