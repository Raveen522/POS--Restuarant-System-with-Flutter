import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../components/CustomShadow.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  //final List categorynamelist;
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int selectedCategoryIndex = 0;

  var category_collection = FirebaseFirestore.instance.collection("categories");
  late List<Map<String, dynamic>> categories = [];

  @override
  Future<void> initState() async {
    var data = await category_collection.get();

    data.docs.forEach((element) {
      categories.add(element.data());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    width: 2.5,
                    color: selectedCategoryIndex == index
                        ? Colors.amber //then color=black
                        : const Color.fromARGB(
                            0, 255, 255, 255) //else color=amber
                    ),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(80, 255, 255, 255),
                      Color.fromARGB(127, 255, 255, 255),
                    ]),
                boxShadow: const [
                  CustomBoxShadow(
                      color: Color.fromARGB(60, 0, 0, 0),
                      blurRadius: 4.0,
                      blurStyle: BlurStyle.outer)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/icons/cetogaries/burger.png", height: 35),
                  Text(
                    categories[index]["name"],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
