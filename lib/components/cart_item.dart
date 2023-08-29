import 'package:flutter/material.dart';
import 'package:pos/components/cart_sub_item_card.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isExpand = false;

  double cardHieght = 120.0;
  double listHeight = 0;
  var expandButtonIcon = Icons.keyboard_arrow_down;

  _updatecard() {
    setState(() {
      if (isExpand == false) {
        cardHieght = 380.0;

        listHeight = 250;
        isExpand = true;
        expandButtonIcon = Icons.keyboard_arrow_up;
      } else {
        cardHieght = 120.0;
        listHeight = 0;

        isExpand = false;
        expandButtonIcon = Icons.keyboard_arrow_down;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController itemGridScrlCtrl = ScrollController();
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 15.0),
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
      padding:
          const EdgeInsets.only(top: 5.0, left: 8.0, right: 8.0, bottom: 7.0),
      height: cardHieght,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: Colors.black,
          width: 1.25,
        ),
        borderRadius: BorderRadius.circular(11),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(56, 0, 0, 0),
              blurRadius: 8.0,
              spreadRadius: 1,
              offset: Offset(0.0, 2.50))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 85,
                  width: 75.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: const Text(
                          "05",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25.0),
                        child: const Icon(Icons.table_bar, size: 60.0),
                      ),
                    ],
                  )),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "No of items: 04",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Price: Rs.3200.00",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Status: Pending",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 400.0,
                  )
                ],
              ),
              SizedBox(
                height: 85.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Add items")),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 64, 0),
                      ),
                      child: const Text("Cancel Order"),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: listHeight,
              width: 610.0,
              //color: Colors.blue,
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                controller: itemGridScrlCtrl,
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: (5 / 1),
                ),
                itemBuilder: (contex, index) {
                  return const CartSubItemCard();
                },
              ),
            ),
          ),
          //item list
          // Container(
          //   padding: EdgeInsets.all(5.0),
          //   margin: EdgeInsets.only(top: 10.0),
          //   color: Color.fromARGB(73, 3, 168, 244),
          //   height: 250.00,
          //   width: 600.0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       CartSubItemCard(),
          //       CartSubItemCard(),
          //       CartSubItemCard()
          //     ],
          //   ),
          // ),
          //end of item list

          SizedBox(
            height: 20.0,
            width: 400.0,
            child: TextButton(
              onPressed: () {
                _updatecard();
              },
              style: TextButton.styleFrom(
                  primary: Colors.black,
                  //minimumSize: Size(70.0, 20.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              child: Icon(
                expandButtonIcon,
                size: 25.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
