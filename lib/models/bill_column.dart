import 'package:flutter/material.dart';

import '../components/bill_item_tile.dart';

class BillColumn extends StatelessWidget {
  const BillColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: 370.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: const [
                    Text(
                      "Bill no:   ",
                    ),
                    Text(
                      "02345",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Discount:",
                    ),
                    SizedBox(
                        width: 100.0,
                        height: 20,
                        child: TextField(
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Voucher code:",
                    ),
                    SizedBox(
                        //color: Colors.blue,
                        width: 100.0,
                        height: 20,
                        child: TextField(
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Voucher Discount:",
                    ),
                    Text(
                      "Rs.1000.00",
                    ),
                  ],
                ),
                const Text(
                    "- - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Item",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Qty",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const Text(
                    "- - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "),
              ],
            ),
          ),
          Flexible(
              flex: 6,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20, //
                  itemBuilder: (BuildContext context, int index) {
                    return const BillItemTile();
                  })),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                const Divider(
                  height: 10.0,
                  thickness: 1.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Rs.1000.00",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Total Discount:",
                    ),
                    Text(
                      "Rs.1000.00",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Sub Total:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Rs.1000.00",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Divider(
                  height: 10.0,
                  thickness: 1.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.5,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Place order")),
              ElevatedButton(onPressed: () {}, child: Text("Pay now")),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
