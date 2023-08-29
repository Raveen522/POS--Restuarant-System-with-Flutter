import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pos/constant.dart';
import 'package:pos/models/cart.dart';

import '../models/voucher_issue.dart';

class CustomAppBarTitle extends StatefulWidget {
  const CustomAppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarTitleState();
}

class _CustomAppBarTitleState extends State<CustomAppBarTitle> {
  String currentDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  String _timeString = "00:00:00 AM";

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTimeString());
    super.initState();
  }

  _getTimeString() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('HH:mm:ss a').format(now);

    setState(() {
      _timeString = formattedTime;
    });
  }

  List<String> items = [
    '01',
    '02',
    '03',
    '04',
    '05',
  ];
  String? selectedItem = '01';

  //+++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Row(
          children: [
            Container(
              width: 130.0,
              height: 35.0,
              padding: const EdgeInsets.only(left: 12.0),
              margin: const EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [shadows]),
              child: Row(
                children: [
                  const Text(
                    "Table No:",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  DropdownButton<String>(
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
                  )
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(bottom: 5.0, right: 15.0, left: 15.0),
              width: 400.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [shadows]),
              child: const TextField(
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search..."),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.card_giftcard),
                iconSize: 40.0,
                onPressed: () async {
                  await showDialog(
                      //barrierDismissible: false,
                      context: context,
                      builder: (context) => StatefulBuilder(
                          builder: (context, setState) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: VoucherIssue(),
                              )));
                  setState(() {});
                },
              ),
              Stack(children: [
                IconButton(
                  onPressed: () async {
                    await showDialog(
                        //barrierDismissible: false,
                        context: context,
                        builder: (context) => StatefulBuilder(
                            builder: (context, setState) => const AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Cart())));
                    setState(() {});
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  iconSize: 40.0,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6.0, left: 30.0),
                  padding: const EdgeInsets.only(left: 2.5),
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    "05",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calculate),
                iconSize: 40.0,
              ),
              Column(
                children: [
                  Text(_timeString),
                  Text(
                    currentDate,
                    style: const TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
