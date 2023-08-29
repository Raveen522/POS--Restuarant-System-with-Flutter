import 'package:flutter/material.dart';

import '../components/glass_morphism.dart';
import '../constant.dart';

import 'package:firedart/firedart.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CollectionReference usersCollection = Firestore.instance.collection('users');

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: loginBackground, //set background image
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/icons/chef.png",
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "My Restaurant",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            GlassContainer(
              padding: const EdgeInsets.only(right: 50.0, left: 50.0),
              height: 350.0,
              width: 300.0,
              borderRadius: 15.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  PhysicalModel(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 3.0,
                    child: const CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage("assets/icons/user (2).png"),
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    controller: userNameTextController,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 17),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5))),
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordTextController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 17),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5))),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100.0, 40.0),
                    ),
                    onPressed: () async {
                      //************ end of logics *************

                      //check are text fields not empty
                      if (userNameTextController.text != "" &&
                          passwordTextController != "") {
                        //

                        // select password from document where documentID = user name text field
                        try {
                          password = (await usersCollection
                                  .document(userNameTextController.text)
                                  .get())
                              .map['password']
                              .toString();

                          //check is PW match
                          if (passwordTextController.text == password) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                "Login Success",
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: Colors.amber,
                            ));

                            // update user status to online
                            await usersCollection
                                .document(userNameTextController.text)
                                .update({
                              'status': 'online',
                            });

                            //if match then login
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => POSScreen(
                                        userName: userNameTextController.text,
                                      )),
                            );
                          } else {
                            // ignore: use_build_context_synchronously
                            showAlertDialog(context);
                          }
                        } catch (e) {
                          showAlertDialog(context);
                        }
                      } else {
                        showAlertDialog(context);
                      }
                      //************ end of logics *************

                      // final users = await usersCollection.get(); //show data
                      // print(users);

                      //add data
                      // await usersCollection.add({
                      //   'userName': 'user2',
                      //   'password': '456789',
                      //   'position': 'cashier'
                      // });

                      // await usersCollection.document("user-01").set({
                      //   'userName': 'userrr',
                      //   'password': '00056789',
                      //   'position': 'ca000shier'
                      // });

                      //update data
                      // await usersCollection
                      //     .document('USo8pebJ6hGVoVOd2ItQ')
                      //     .update({
                      //   'userName': 'manager01',
                      // });

                      //delete data
                      // await usersCollection
                      //     .document('USo8pebJ6hGVoVOd2ItQ')
                      //     .delete();
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Developed by Raveen",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Login Error"),
              icon: const Icon(
                Icons.warning_amber_rounded,
                size: 50,
              ),
              iconColor: Colors.red,
              content: const Text(
                  "Invalid user name or password. Please check again!"),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      userNameTextController.clear();
                      passwordTextController.clear();
                    },
                    child: const Text("Try again"))
              ],
            ));
  }
}
