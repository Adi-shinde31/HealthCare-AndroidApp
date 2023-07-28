import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  String date = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text("Add a New Prescription"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border:InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white
              ),

            ),
            const SizedBox(height:5),
            Text(date,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
            const SizedBox(height:12),

            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border:InputBorder.none,
                  hintText: "Prescription Details",
                  hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                  color: Colors.white
              ),
            ),

          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "note_title": _titleController.text,
            "creation_date": date,
            "note_content": _mainController.text
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError((error) => print("Failed to add new Prescription due to $error"));
        },
        tooltip: 'Save',
        child: const Icon(Icons.save, color: Colors.teal),

      ),
    );
  }
}
