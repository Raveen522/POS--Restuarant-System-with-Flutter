import 'package:flutter/material.dart';

class CartSubItemCard extends StatelessWidget {
  const CartSubItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 290.0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: Colors.black,
            width: 1.25,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(75, 0, 0, 0),
                blurRadius: 6.0,
                spreadRadius: 0.1,
                offset: Offset(0.0, 0.8))
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 45.0,
              width: 45.0,
              margin: const EdgeInsets.only(left: 4.0, right: 6.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2.5,
                    color: Colors.amber, //else color=amber
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(56, 0, 0, 0),
                        blurRadius: 5.0,
                        spreadRadius: 0.3,
                        offset: Offset(0.0, 1.50))
                  ],
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/items/Burgers/9K8A5786.jpg'),
                      fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Cheese Burger x 01",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Rs.700.00",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                    width: 0.8, color: Color.fromARGB(255, 0, 0, 0)),
                elevation: 3.0,
                primary: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size(10, 10),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              child: const Icon(
                Icons.remove,
                size: 10.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                    width: 0.8, color: Color.fromARGB(255, 0, 0, 0)),
                elevation: 3.0,
                primary: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size(10, 10),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              child: const Icon(
                Icons.add,
                size: 10.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                    width: 0.8, color: Color.fromARGB(255, 0, 0, 0)),
                elevation: 3.0,
                primary: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size(10, 10),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              child: const Icon(
                Icons.delete,
                size: 18.0,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
