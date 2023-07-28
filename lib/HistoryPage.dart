import 'package:android_projects/note_editor.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'note_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical History'),
        backgroundColor: Colors.teal
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasData) {
                  return GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children:
                    snapshot.data!.docs.map((note) => noteCard(() {}, note))
                        .toList(),
                  );
                }
                return const Text("There is not notes");

              }
            )
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteEditorScreen()));
        },
        label: const Text("Add Prescription",
          style: TextStyle(
            color: Colors.teal,
          ),
        ),

        icon: const Icon(Icons.add, color: Colors.teal),
        tooltip: 'Add a new Prescription',
      )


    );
  }
}
