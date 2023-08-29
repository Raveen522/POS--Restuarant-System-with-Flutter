import 'package:flutter/material.dart';

import 'CustomShadow.dart';
import 'glass_morphism.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
      child: GlassContainer(
        padding: const EdgeInsets.all(5.0),
        width: 150.0,
        height: 200.0,
        borderRadius: 8.0,
        child: Column(
          children: [
            Container(
              height: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.amber, //else color=amber
                  ),
                  boxShadow: const [
                    CustomBoxShadow(
                        color: Color.fromARGB(160, 0, 0, 0),
                        blurRadius: 4.0,
                        blurStyle: BlurStyle.outer)
                  ],
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/items/Burgers/9K8A5786.jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Chicken Burger",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Rs.170.00",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: null,
                        child: Icon(
                          Icons.remove,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: const Size(20, 20),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: const Size(20, 20),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(12),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
