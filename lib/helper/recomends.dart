import 'package:carinfo/pages/viewpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductLists extends StatelessWidget {
  final listName;
  final listImage;
  final listSeat;
  final listCont;
  final listFuel;
  final desc;
  final door;
  ProductLists(
      {this.listName,
      this.listImage,
      this.door,
      this.desc,
      this.listSeat,
      this.listCont,
      this.listFuel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => Viewpage(
              image: listImage,
              name: listName,
              door: door,
              fuel: listFuel,
              desc: desc,
              seat: listSeat,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 20),
        child: Card(
          color: Colors.white,
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      listName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 211, 211, 211),
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Viewpage(
                                  image: listImage,
                                  name: listName,
                                  door: door,
                                  fuel: listFuel,
                                  desc: desc,
                                  seat: listSeat,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                Image.asset(
                  listImage,
                  height: 100,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '$listSeat-Seater',
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      ' $listCont',
                      style: const TextStyle(fontSize: 10),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$listFuel',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
