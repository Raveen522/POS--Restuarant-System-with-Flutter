import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firedart/firedart.dart';

import 'package:pos/models/account_settigns.dart';
import 'package:pos/screens/login_screen.dart';

class CustomDrawer extends StatefulWidget {
  final String userName;

  CustomDrawer({super.key, required this.userName});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  CollectionReference usersCollection = Firestore.instance.collection('users');
  var user;
  var password = "";
  var position = "";
  var orders = "";
  var contribution = "";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 220,
            child: DrawerHeader(
                child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(right: 10.0),
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.2),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('assets/images/items/avatar.jpg'),
                        fit: BoxFit.contain),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const Text(
                  "Cashier",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                    onPressed: () async {
                      await showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Logout"),
                                icon: const Icon(
                                  Icons.warning_amber_rounded,
                                  size: 50,
                                ),
                                iconColor: Colors.amber,
                                content: SizedBox(
                                  height: 60,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("What do you want?"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () async {
                                                // update user status to offline
                                                await usersCollection
                                                    .document(widget.userName)
                                                    .update({
                                                  'status': 'offline',
                                                });

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                );

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                    "Logged out",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  backgroundColor: Colors.amber,
                                                ));
                                              },
                                              child: const Text("Logout")),
                                          OutlinedButton(
                                              onPressed: () async {
                                                // update user status to offline
                                                await usersCollection
                                                    .document(widget.userName)
                                                    .update({
                                                  'status': 'offline',
                                                });

                                                exit(0);
                                              },
                                              child: const Text(
                                                  "Logout and exit")),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    },
                    child: const Text("Logout"))
              ],
            )),
          ),
          ListTile(
            title: const Text("Account"),
            leading: const Icon(Icons.account_circle_rounded),
            onTap: () async {
              user = (await usersCollection.document(widget.userName).get())
                  .map['userName']
                  .toString();

              password = (await usersCollection.document(widget.userName).get())
                  .map['password']
                  .toString();

              position = (await usersCollection.document(widget.userName).get())
                  .map['position']
                  .toString();

              orders = (await usersCollection.document(widget.userName).get())
                  .map['total_orders']
                  .toString();

              contribution =
                  (await usersCollection.document(widget.userName).get())
                      .map['total_contribution']
                      .toString();

              await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => StatefulBuilder(
                      builder: (context, setState) => AccountSettings(
                            userName: widget.userName,
                            user: user,
                            password: password,
                            position: position,
                            orders: orders,
                            contribution: contribution,
                          )));
              setState(() {});
            },
          ),
          ListTile(
            title: const Text("Orders"),
            leading: const Icon(Icons.shop_2_rounded),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Sales"),
            leading: const Icon(Icons.currency_exchange_rounded),
            onTap: () {
              print("S");
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.exit_to_app_rounded),
            onTap: () {
              print("logout");
            },
          )
        ],
      ),
    );
  }
}
