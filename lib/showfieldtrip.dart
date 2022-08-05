import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mfieldtrip/SoloFieldTrips.dart';

class Cfieldtrip extends StatefulWidget {
  const Cfieldtrip({Key? key}) : super(key: key);

  @override
  State<Cfieldtrip> createState() => _CfieldtripState();
}

class _CfieldtripState extends State<Cfieldtrip> {

  List<Model> list=[];
  void fetchData()async{
    var data=await FirebaseFirestore.instance.collection("trips").get();
    for(int i=0;i<data.docs.length;i++){
      Model model=Model(data.docs[i].data()['title'],data.docs[i].data()['author'],data.docs[i].data()['category'], data.docs[i].data()['duration']);
      list.add(model);
    }
  }

  navigateToSoloFieldTrip() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SoloFieldTrip()));
  }
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('FieldTrips',style:
            TextStyle(fontSize: 20.0),),
          ),backgroundColor: Colors.lightGreen,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: list.length==0? Center(child: Text("No Trips")):ListView.builder(itemCount: list.length,
            itemBuilder:(_,index){
              return MyUI(list[index].title, list[index].author, list[index].category, list[index].duration);
            },
          ),
        ),
      ),
    );
  }
  Widget MyUI(String title,String author,String category,String duration){

    return Center(
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(13),
            child:
            Table(
                // defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2),
                children: [
      TableRow( children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children:[InkWell(child: Text(title), onTap: navigateToSoloFieldTrip,),]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children:[Text(author)]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children:[Text(category)]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children:[Text(duration)]),
        ),
      ]),
    ],
     ),
    ),
    ],
    ),
    );
  }
}

class Model{
  String title,author,category,duration;
  Model(this.title,this.author,this.category,this.duration);
}