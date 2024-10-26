import 'package:carinfo/helper/recomends.dart';
import 'package:carinfo/models/carCard.dart';
import 'package:carinfo/repository/carCardslist.dart';
import 'package:flutter/material.dart';

class CarInside extends StatefulWidget {
  final String category;
  const CarInside({super.key, required this.category});

  @override
  State<CarInside> createState() => _CarInsideState();
}

class _CarInsideState extends State<CarInside>
    with SingleTickerProviderStateMixin {
  late List<Product> filteredCars;

  @override
  void initState() {
    super.initState();
    _filterCars();
  }

  void _filterCars() {
    filteredCars = productList
        .where((car) =>
            car.category.toLowerCase() == widget.category.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: Text(
          widget.category.toUpperCase(),
          style: TextStyle(wordSpacing: 4),
        ),
        centerTitle: true,
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
      body: filteredCars.isEmpty
          ? Center(
              child: CircularProgressIndicator()) // Yuklanayotgan ko'rsatma
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: filteredCars.length,
                    itemBuilder: (context, index) {
                      final product = filteredCars[index];
                      return ProductLists(
                        listImage: product.image,
                        listName: product.name,
                        listCont: product.controls,
                        listFuel: product.fuel,
                        listSeat: product.seat,
                        desc: product.desc,
                        door: product.door,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
