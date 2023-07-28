import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: const TextStyle(
              color:Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height:5),
          Text(
            doc["creation_date"],
            style: const TextStyle(
                color:Colors.white54,
            ),
          ),
          SizedBox(height:10),
          Text(
            doc["note_content"],
            style: const TextStyle(
              color:Colors.white,
            ),
          )
        ],
      )
    )
  );
}