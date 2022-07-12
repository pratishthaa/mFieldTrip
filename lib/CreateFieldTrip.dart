import 'package:flutter/material.dart';

class CreateFieldTrip extends StatefulWidget {
  const CreateFieldTrip({Key? key}) : super(key: key);

  @override
  State<CreateFieldTrip> createState() => _CreateFieldTripState();
}

class _CreateFieldTripState extends State<CreateFieldTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('meksk',style:
            TextStyle(fontSize: 30.0),),
          ),backgroundColor: Colors.lightGreen,
        ),
      ),
      body: const Center(
        child: Text('My Page!'),

      ),
    );
  }
}
