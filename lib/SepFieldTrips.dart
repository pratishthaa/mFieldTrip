import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mfieldtrip/my_custom_icons_icons.dart';

class SepFieldTrips extends StatelessWidget {
  
  final DocumentSnapshot documentSnapshot;
  const SepFieldTrips({Key? key, required this.documentSnapshot}) : super(key: key);
  _getApplicablePeriod(String visitingPeriod) {
    switch (visitingPeriod) {
      case "Spring":
        return Icon(MyCustomIcons.spring,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "Summer":
        return Icon(MyCustomIcons.summer,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "Winter":
        return Icon(MyCustomIcons.winter,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      default:
        return Icon(MyCustomIcons.all_year,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
    }
  }
    _getApplicableDuration(String duration) {
    switch (duration) {
      case "one day or less":
        return Icon(MyCustomIcons.duration_one,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "two to four days":
        return Icon(MyCustomIcons.duration_two,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      // case "Winter":
      //   return Icon(MyCustomIcons.calendar_mouse,size: 50,);
      default:
        return Icon(MyCustomIcons.duration_four,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
    }
  }

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
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
                      width: MediaQuery.of(context).size.width * 0.90,
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
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Image(image: NetworkImage(documentSnapshot['images']), fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getApplicableDuration(documentSnapshot['duration']),
                          _getApplicablePeriod(documentSnapshot['visiting period']),
                          documentSnapshot['is access limited']==true ?  Icon(MyCustomIcons.limited_access,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.limited_access,size: 50, color:Color.fromARGB(255, 214, 214, 215)),
                          documentSnapshot['park or protected area']==true ?  Icon(MyCustomIcons.park,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.park,size: 50,color:Color.fromARGB(255, 214, 214, 215)),
                          documentSnapshot['any fees']==true ?  Icon(MyCustomIcons.fees,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.fees,size: 50,color:Color.fromARGB(255, 214, 214, 215)),

                      ],
                      ),
                  ),
                ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
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
                      width: MediaQuery.of(context).size.width * 0.90,
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
                      width: MediaQuery.of(context).size.width * 0.90,
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
      ),
    );
  }
}
