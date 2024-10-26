import 'package:animated_background/animated_background.dart';
import 'package:carinfo/extracked/datas.dart';
import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  const Viewpage(
      {super.key,
      required this.image,
      required this.door,
      required this.fuel,
      required this.desc,
      required this.seat,
      required this.name});
  final String name;
  final String door;
  final String seat;
  final String image;
  final String fuel;
  final String desc;
  @override
  State<Viewpage> createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 1200,
                color: Color(0xffDDDDFF),
                child: AnimatedBackground(
                  vsync: this,
                  behaviour: RandomParticleBehaviour(
                      options: const ParticleOptions(
                          spawnMaxRadius: 40,
                          spawnMinSpeed: 12,
                          particleCount: 60,
                          spawnMaxSpeed: 40,
                          spawnOpacity: 0.8,
                          baseColor: Color(0xff5D5D8F))),
                  child: Center(),
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Color(0xff1F214A),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0xff1F214A), width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          widget.name,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: 400,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Color(0xffffffff), width: 2),
                    ),
                  )),
              Datas(widget: widget)
            ]),
          ],
        ),
      ),
    );
  }
}
