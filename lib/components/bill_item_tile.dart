import 'package:flutter/material.dart';
import 'package:pos/constant.dart';

class BillItemTile extends StatelessWidget {
  const BillItemTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [shadows],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Chese Burger aa",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.0),
                ),
                Text(
                  "Rs.9999.99",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 85,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 0.8, color: Colors.black),
                      elevation: 2.5,
                      primary: Colors.white,
                      minimumSize: const Size(10, 10),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12)),
                  child: const Icon(
                    Icons.remove,
                    size: 10.0,
                  ),
                ),
                const Text(
                  "01",
                  style: TextStyle(fontSize: 14),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 0.8, color: Colors.black),
                      elevation: 2.5,
                      primary: Colors.white,
                      minimumSize: const Size(10, 10),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12)),
                  child: const Icon(
                    Icons.add,
                    size: 10.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 80,
            child: Text(
              "50999.00",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 0.8, color: Colors.black),
                elevation: 2.5,
                primary: Colors.white,
                minimumSize: const Size(10, 10),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12)),
            child: const Icon(
              color: Colors.red,
              Icons.delete,
              size: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
