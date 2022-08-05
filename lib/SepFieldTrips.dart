import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SepFieldTrips extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const SepFieldTrips({Key? key, required this.documentSnapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[100],
      appBar:
      AppBar(
        toolbarHeight: 150,
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title:
          ListTile(
            title:
            Text(documentSnapshot['title'], style: TextStyle(color:Colors.white, fontSize: 20)),
            subtitle:
            Text(documentSnapshot['trip offered by'], style: TextStyle(color:Colors.white)),
          )
      ),

      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 340,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(documentSnapshot['description'],),
                  ],
                  ),
                ),
              ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Author", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(documentSnapshot['author'],),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Visiting Period", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(documentSnapshot['visiting period'],),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Level", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(documentSnapshot['level'],),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Category", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(documentSnapshot['category'],),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 340,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Duration", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(documentSnapshot['duration'],),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
