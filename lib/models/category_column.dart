import 'package:flutter/material.dart';

import '../components/glass_morphism.dart';
import 'category_list.dart';

class CategoryColumn extends StatefulWidget {
  const CategoryColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryColumn> createState() => _CategoryColumnState();
}

class _CategoryColumnState extends State<CategoryColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: GlassContainer(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 20.0),
        borderRadius: 12.0,
        child: Column(
          children: const [
            Text("Category",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                )),
            CategoryListView(),
          ],
        ),
      ),
    );
  }
}
