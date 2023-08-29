import 'package:flutter/material.dart';

import '../components/glass_morphism.dart';
import '../components/menu_item_card.dart';

class ItemMenuColumn extends StatelessWidget {
  const ItemMenuColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: GlassContainer(
        padding: const EdgeInsets.only(
            top: 10.0, left: 15.0, right: 15.0, bottom: 20.0),
        borderRadius: 12.0,
        child: Column(
          children: [
            const Text(
              "Food title",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Divider(
              height: 10.0,
              thickness: 1.5,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10.0,
                  direction: Axis.horizontal,
                  children: List.generate(11, (index) => ItemCard()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
