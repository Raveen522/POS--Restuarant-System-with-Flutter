import 'package:flutter/material.dart';


import '../components/custom_appbar_title.dart';
import '../components/custom_drawer.dart';
import '../models/bill_column.dart';
import '../models/category_column.dart';
import '../models/menu_column.dart';

class POSScreen extends StatefulWidget {
  final String userName;

  POSScreen({
    super.key,
    required this.userName,
  });

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: const CustomAppBarTitle(),
        ),
        drawer: CustomDrawer(userName: widget.userName,),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: Image.asset('assets/images/backgrounds/Pos Background.jpg')
                .image,
          )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 2, child: CategoryColumn()),
              Flexible(flex: 7, child: ItemMenuColumn()),
              Flexible(flex: 4, child: BillColumn())
            ],
          ),
        ));
  }
}
