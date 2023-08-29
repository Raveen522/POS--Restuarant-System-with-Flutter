import 'package:flutter/material.dart';
import 'package:firedart/firedart.dart';

import 'package:pos/components/glass_morphism.dart';

class AccountSettings extends StatefulWidget {
  final String userName;
  final String user;
  final String password;
  final String position;
  final String orders;
  final String contribution;
  const AccountSettings(
      {super.key,
      required this.userName,
      required this.user,
      required this.password,
      required this.position,
      required this.orders,
      required this.contribution});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  CollectionReference usersCollection = Firestore.instance.collection('users');

  final currentPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final confirmNewPasswordTextController = TextEditingController();

  bool isTextFieldEnabled = false;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: GlassContainer(
        padding: const EdgeInsets.all(10.0),
        borderRadius: 10.0,
        height: 450.0,
        width: 320.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close_rounded),
                  iconSize: 22,
                  color: Colors.red,
                )
              ],
            ),
            const Divider(
              height: 1.0,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 52,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/items/avatar.jpg'),
                    radius: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.user,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white)),
                    Text("User name: ${widget.userName}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white)),
                    Text("Position: ${widget.position}",
                        style: const TextStyle(color: Colors.white)),
                    Text("Total Orders: ${widget.orders}",
                        style: const TextStyle(color: Colors.white)),
                    Text("Total Contribution: Rs.${widget.contribution}",
                        style: const TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 250,
              child: Column(
                children: [
                  TextField(
                    obscureText: true,
                    autofocus: true,
                    enabled: isTextFieldEnabled,
                    controller: newPasswordTextController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 17),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5))),
                  ),
                  TextField(
                    obscureText: true,
                    enabled: isTextFieldEnabled,
                    controller: confirmNewPasswordTextController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        labelText: "Confirm password",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 17),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        checkPasswordDialog();
                      },
                      child: const Text("Change Password")),
                  ElevatedButton(
                      onPressed: () async {
                        if (newPasswordTextController.text ==
                            confirmNewPasswordTextController.text) {
                          await usersCollection
                              .document(widget.userName)
                              .update({
                            'password': newPasswordTextController.text,
                          });

                          newPasswordTextController.clear();
                          confirmNewPasswordTextController.clear();

                          setState(() {
                            isTextFieldEnabled = false;
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "Password Changed!",
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Colors.lightGreen,
                          ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    title: Text(
                                      "Passwords doesn't match !",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ));
                        }
                      },
                      child: const Text("Save")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future checkPasswordDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Enter your current password"),
            content: TextField(
              autofocus: true,
              obscureText: true,
              controller: currentPasswordTextController,
            ),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    if (currentPasswordTextController.text == widget.password) {
                      setState(() {
                        isTextFieldEnabled = true;

                        Navigator.of(context).pop();
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text(
                                  "Invalid Password !",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ));
                    }
                  },
                  child: Text("Ok"))
            ],
          ));
}
