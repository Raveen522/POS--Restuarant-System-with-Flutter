import 'package:flutter/material.dart';

import '../components/cart_item.dart';
import '../components/glass_morphism.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    ScrollController scrollCtrlPendingorderslist = ScrollController();
    ScrollController scrollCtrlCompletedorderslist = ScrollController();

    return GlassContainer(
      padding: const EdgeInsets.all(10.0),
      height: 520.0,
      width: 720.0,
      borderRadius: 12.0,
      borderWidth: 2.0,
      blurValue: 20.0,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top: 15.0),
                  height: 35.0,
                  width: 400.0,
                  child: TabBar(
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    controller: tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Pending Orders",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Completed Orders",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  height: 1.0,
                  thickness: 3.0,
                  color: Colors.white,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 420.0,
                  child: TabBarView(
                      physics: const ClampingScrollPhysics(),
                      controller: tabController,
                      children: [
                        ListView.builder(
                            controller: scrollCtrlPendingorderslist,
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return const CartItem();
                            }),
                        ListView.builder(
                            controller: scrollCtrlCompletedorderslist,
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return const CartItem();
                            }),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
