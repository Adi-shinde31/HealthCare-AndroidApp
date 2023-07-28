import 'package:android_projects/zombie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:android_projects/auth.dart';
import 'package:android_projects/mapPage.dart';

import 'AboutApp.dart';
import 'AppointmentPage.dart';
import 'HistoryPage.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
        onPressed: signOut,
        child: const Text('Sign Out')

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HealthCare App"),
        backgroundColor: Colors.teal,

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'LogOut',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return _signOutButton();
                },
              ));
            },
          )
        ],
      ),


      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                const CircleAvatar(radius: 70,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.medical_services, size: 100, color: Colors.white)),
                const SizedBox(height: 10),
                const Text("Welcome !",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )
                ),
                // const Text("Your Name",
                //     style: TextStyle(
                //       fontSize: 40,
                //       fontWeight: FontWeight.bold,
                //     )
                // ),
                Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return const MapPage();
                                    },
                                  ));
                                },
                                color: Colors.teal,

                                textColor: Colors.white,
                                child: const Text("Find Doctor Near You",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // maxLines: 2,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return const AppointmentPage();
                                    },
                                  ));
                                },
                                color: Colors.teal,

                                textColor: Colors.white,
                                child: const Text("Get an Appointment",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // maxLines: 2,

                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return const HistoryPage();
                                    },
                                  ));
                                },
                                color: Colors.teal,

                                textColor: Colors.white,
                                child: const Text("Your Medical History",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // maxLines: 2,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ),


                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 50,

                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return const AboutApp();
                                    },
                                  ));
                                },

                                color: Colors.teal,

                                textColor: Colors.white,
                                child: const Text("About this App",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // maxLines: 2,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    )
                )
              ]
          )
      ),
    );
  }
}