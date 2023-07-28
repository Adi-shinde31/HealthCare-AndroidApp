import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  get screenWidth => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About this App'),
        backgroundColor: Colors.teal

      ),
      body: SingleChildScrollView(
        child: Container(
            width: screenWidth,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    'App Details:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 8),
                Text('''
- HealthCare App will help the user to get an appointment with a doctor. This app also provides an option to add medical prescription given to the user. User can also look for a nearby doctor using the map option.''',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "What's New ?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const ListTile(
                  leading: Icon(Icons.check,color: Colors.green),
                  title: Text('Map to find your nearest Doctor.'),
                ),
                const ListTile(
                  leading: Icon(Icons.check,color: Colors.green),
                  title: Text('Form to get appointment with doctors.'),
                ),
                const ListTile(
                  leading: Icon(Icons.check,color: Colors.green),
                  title: Text('A place to store details about your medical history.'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    'App info:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Version"),
                          Text("1.0.0")
                        ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Updated on"),
                          Text("27-April-2023")
                        ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Download Size"),
                          Text("22.5 MB")
                        ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Required OS"),
                          Text("Android 7 and up")
                        ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Released on"),
                          Text("April 2023")
                        ],
                      ),
                      const SizedBox(height:15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text("Internet Connection"),
                          Text("Required")
                        ],
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    'App Developers:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.link,color: Colors.blue),
                  title: const Text('Aditya Shinde',
                  style: TextStyle(
                      color:Colors.blue,
                  )),
                  onTap: () => launchUrl(Uri.parse('https://github.com/Adi-shinde31')),
                ),
                ListTile(
                  leading: const Icon(Icons.link,color: Colors.blue),
                  title: const Text('Vinayak Utekar',
                      style: TextStyle(
                        color:Colors.blue,
                      )),
                  onTap: () => launchUrl(Uri.parse('https://github.com/VinayakUtekar')),
                ),
                ListTile(
                  leading: const Icon(Icons.link,color: Colors.blue),
                  title: const Text('Sahil Sawant',
                  style: TextStyle(
                      color:Colors.blue,
                  )),
                  onTap: () => launchUrl(Uri.parse('https://www.instagram.com/yourpage')),
                ),


              ],
            )
        ),
      )





























      // Column(
      //     children: const <Widget>[
      //       Padding(
      //         padding: EdgeInsets.only(left:10, top:20),
      //         child: Text("App Details..",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold,
      //             backgroundColor: Colors.grey
      //
      //           )),
      //       ),
      //       SizedBox(
      //           height:20
      //       ),
      //       Text("This app will help the user to get an appointment with a doctor.",
      //         textAlign: TextAlign.start,
      //         style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //             backgroundColor: Colors.grey
      //
      //         )),
      //
      //     ],
      //   ),


    );
  }
}
