import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mfieldtrip/my_custom_icons_icons.dart';

class SepFieldTrips extends StatelessWidget {
  
  final DocumentSnapshot documentSnapshot;
  const SepFieldTrips({Key? key, required this.documentSnapshot}) : super(key: key);
  _getApplicablePeriod(String visitingPeriod) {
    switch (visitingPeriod) {
      case "Spring":
        return Image(image: AssetImage('images/mfieldtrip_icons_images/spring.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.spring,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "Summer":
        return Image(image: AssetImage('images/mfieldtrip_icons_images/summer.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.summer,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "Winter":
        return Image(image: AssetImage('images/mfieldtrip_icons_images/winter.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.winter,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      default:
        return Image(image: AssetImage('images/mfieldtrip_icons_images/all_year.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.all_year,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
    }
  }
    _getApplicableDuration(String duration) {
    switch (duration) {
      case "one day or less":
        return Image(image: AssetImage('images/mfieldtrip_icons_images/duration_one.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.duration_one,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      case "two to four days":
        return Image(image: AssetImage('images/mfieldtrip_icons_images/duration_two.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.duration_two,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
      // case "Winter":
      //   return Icon(MyCustomIcons.calendar_mouse,size: 50,);
      default:
        return Image(image: AssetImage('images/mfieldtrip_icons_images/duration_four.png'), width: 200, height: 200, fit: BoxFit.fill,);
        // return Icon(MyCustomIcons.duration_four,size: 50,color: Color.fromARGB(255, 117, 116, 116),);
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _getApplicableDuration(documentSnapshot['duration']),
                          _getApplicablePeriod(documentSnapshot['visiting period']),
                          documentSnapshot['is access limited']==true ?  Image(image: AssetImage('images/mfieldtrip_icons_images/limited_access.png'), width: 200, height: 200, fit: BoxFit.fill,) : Image(image: AssetImage('images/mfieldtrip_icons_images/limited_access.png'), colorBlendMode: BlendMode.darken, width: 200, height: 200, fit: BoxFit.fill,),
                          // documentSnapshot['is access limited']==true ?  Icon(MyCustomIcons.limited_access,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.limited_access,size: 50, color:Color.fromARGB(255, 214, 214, 215)),
                          documentSnapshot['park or protected area']==true ? Image(image: AssetImage('images/mfieldtrip_icons_images/park.png'), width: 200, height: 200, fit: BoxFit.fill,) : Image(image: AssetImage('images/mfieldtrip_icons_images/park.png'), colorBlendMode: BlendMode.darken, width: 200, height: 200, fit: BoxFit.fill,),
                          // documentSnapshot['park or protected area']==true ?  Icon(MyCustomIcons.park,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.park,size: 50,color:Color.fromARGB(255, 214, 214, 215)),
                          documentSnapshot['any fees']==true ?  Image(image: AssetImage('images/mfieldtrip_icons_images/fees.png'), width: 200, height: 200, fit: BoxFit.fill,) : Image(image: AssetImage('images/mfieldtrip_icons_images/fees.png'), colorBlendMode: BlendMode.darken, width: 200, height: 200, fit: BoxFit.fill,),
                          // documentSnapshot['any fees']==true ?  Icon(MyCustomIcons.fees,size: 50,color: Color.fromARGB(255, 117, 116, 116),) : Icon(MyCustomIcons.fees,size: 50,color:Color.fromARGB(255, 214, 214, 215)),
                          Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Image(image: AssetImage('images/mfieldtrip_icons_images/distance.png'), height: 200,width: 200,fit: BoxFit.fill,),),
        Container(
            alignment: Alignment.center,
            child: Text(
              documentSnapshot['distance']+' KM',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40.0),)),],),
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
