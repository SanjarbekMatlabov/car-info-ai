import 'package:carinfo/helper/allcars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BestCategory extends StatefulWidget {
  const BestCategory({super.key});

  @override
  State<BestCategory> createState() => _BestCategoryState();
}

class _BestCategoryState extends State<BestCategory> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _totalPages = 1;
  void _goToNextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // Sahifani orqaga qaytarish
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            height: 240, // PageView'ning balandligini belgilash
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40, top: 20),
                  child: GridView.count(
                    crossAxisCount: 3, // Har bir qator uchun 3 ta element
                    crossAxisSpacing:
                        10, // Elementlar orasidagi gorizontal bo'sh joy
                    mainAxisSpacing:
                        10, // Elementlar orasidagi vertikal bo'sh joy
                    children: [
                      CategoryProducts(
                        image: 'assets/brands/chevro.png',
                        text: 'Chevrolet',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "chevrolet",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/porsche.png',
                        text: 'Porsche',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "porsche",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/merc.png',
                        text: 'Mercedes',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "mercedes-benz",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/suzuki.png',
                        text: 'Suzuki',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "suzuki",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/audi.png',
                        text: 'Audi',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "audi",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/bmw.png',
                        text: 'BMW',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "bmw",
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 40.0, right: 40, top: 20),
                  child: GridView.count(
                    crossAxisCount: 3, // Har bir qator uchun 3 ta element
                    crossAxisSpacing:
                        10, // Elementlar orasidagi gorizontal bo'sh joy
                    mainAxisSpacing:
                        10, // Elementlar orasidagi vertikal bo'sh joy
                    children: [
                      CategoryProducts(
                        image: 'assets/brands/wolkswagen.png',
                        text: 'Volkswagen',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "volkswagen",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/hyundai.png',
                        text: 'Hyundai',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "hyundai",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/suzuki.png',
                        text: 'Suzuki',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "suzuki",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/audi.png',
                        text: 'Audi',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "audi",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/merc.png',
                        text: 'Benz',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "mercedes-benz",
                                      )));
                        },
                      ),
                      CategoryProducts(
                        image: 'assets/brands/bmw.png',
                        text: 'BMW',
                        press: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => CarInside(
                                        category: "bmw",
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_currentPage > 0)
            Positioned(
              left: 10,
              top: 80,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                onPressed: _goToPreviousPage,
              ),
            ),
          // O'ngdagi tugma (Oldinga)
          if (_currentPage < _totalPages)
            Positioned(
              right: 10,
              top: 80,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios,
                    size: 20, color: Colors.black),
                onPressed: _goToNextPage,
              ),
            ),
        ]),
      ],
    );
  }
}

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({
    required this.image,
    required this.text,
    required this.press,
    super.key,
  });

  final String image, text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(10.0), // Rasm atrofidagi padding
            child: Image.asset(
              image,
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Soyaning rangi va shaffofligi
                spreadRadius: 2, // Soyaning yoyilishi
                blurRadius: 7, // Soyaning xiralashuvi (blur)
                offset:
                    Offset(0, 6), // Soyaning ko'chishi (x va y o'qi bo'yicha)
              ),
            ], borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
          SizedBox(height: 8), // Text bilan rasm orasidagi bo'sh joy
          Text(text),
        ],
      ),
    );
  }
}
