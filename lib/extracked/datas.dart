import 'package:carinfo/pages/viewpage.dart';
import 'package:flutter/material.dart';

class Datas extends StatelessWidget {
  const Datas({
    super.key,
    required this.widget,
  });

  final Viewpage widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 250,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 280,
                    height: 240,
                    child: Image.asset(
                      widget.image,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            child: Column(
                              children: [
                                Text(
                                  widget.seat,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Seats",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 78, 78, 78)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            child: Column(
                              children: [
                                Text(
                                  widget.door,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "Doors",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 78, 78, 78)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 5, bottom: 5),
                            child: Column(
                              children: [
                                Text(
                                  widget.fuel,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Fuel",
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 78, 78, 78)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 40,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(widget.desc),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
