import 'package:carinfo/helper/best_category.dart';
import 'package:carinfo/helper/recomends.dart';
import 'package:carinfo/helper/side_menu.dart';
import 'package:carinfo/models/carCard.dart';
import 'package:carinfo/repository/carCardslist.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late List<Product> randomCars;
  late List<Product> displayedCars; // Ko'rsatiladigan mashinalar
  int displayedCarsCount = 5; // Boshlang'ich ko'rsatiladigan mashinalar soni
  ScrollController _scrollController = ScrollController();
  bool showButton = false; // Tugma ko'rsatish uchun
  bool isLoading = false; // Loading holatini belgilovchi o'zgaruvchi

  @override
  void initState() {
    super.initState();
    _getRandomCars();

    // Scrollni kuzatish
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          showButton = true; // Tugma ko'rinadi
        });
      } else {
        setState(() {
          showButton = false; // Tugma yo'qoladi
        });
      }
    });
  }

  void _getRandomCars() {
    // Barcha mashinalarni shuffle qilish va maksimal 5 ta qo'shish
    randomCars = List<Product>.from(productList);
    randomCars.shuffle();
    displayedCars = randomCars
        .take(displayedCarsCount)
        .toList(); // Boshlang'ich ko'rsatiladigan mashinalar
  }

  void _addMoreCars() async {
    if (isLoading)
      return; // Agar loading bo'lsa, yana bir marta bosish mumkin emas

    setState(() {
      isLoading = true; // Loadingni boshlash
    });

    // 2 soniyadan so'ng yangi mashinalarni qo'shish
    await Future.delayed(Duration(seconds: 2), () {
      // 5 ta yangi mashina qo'shamiz
      setState(() {
        displayedCarsCount += 5;
        List<Product> availableCars = List<Product>.from(productList);
        availableCars.removeWhere((car) => displayedCars.contains(
            car)); // Oldin ko'rsatilgan mashinalarni chiqarib tashlash

        // Yangi mashinalarni olish
        if (availableCars.isNotEmpty) {
          availableCars
              .shuffle(); // Qolgan mashinalarni random qilib joylashtirish
          final newCars = availableCars.take(5).toList(); // Yangi 5 mashina
          displayedCars.addAll(newCars); // Yangi mashinalarni qo'shish
        }
        isLoading = false; // Loadingni tugatish
        showButton = false; // Tugmani yo'qotish
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuSideBar(),
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Car Info'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.photo_camera)),
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.filter_alt))
        ],
      ),
      body: Stack(
        // Stack ishlatish
        children: [
          ListView(
            controller: _scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 20, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 211, 211, 211),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // Ramkani yo'q qiladi
                        borderRadius:
                            BorderRadius.circular(20.0), // Chegarani radiusi
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Cars ..."),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Best Brands",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              BestCategory(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Recommends",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              // Recommends section
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Scrollni o'chirish
                itemCount: displayedCars.length,
                itemBuilder: (context, index) {
                  final product = displayedCars[index];
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
              SizedBox(height: 80), // Tugma uchun joy qoldiramiz
            ],
          ),
          // Tugma
          if (showButton) // Faqat scroll oxiriga kelganda tugma paydo bo'ladi
            Positioned(
              bottom: 5,
              left: 20,
              right: 20,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : _addMoreCars, // Loading bo'lganda tugma faol emas
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), // Aylana shakli
                      padding: EdgeInsets.all(20), // Tugma ichidagi maydon
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: isLoading
                        ? CircularProgressIndicator() // Loading animatsiyasi
                        : Text("+"), // Tugma matni
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
