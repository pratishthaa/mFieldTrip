import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mfieldtrip/SepFieldTrips.dart';
import 'package:gap/gap.dart';
import 'package:mfieldtrip/utils/app_styles.dart';
import '../utils/app_layout.dart';


class SoloFieldTrip extends StatefulWidget {
  const SoloFieldTrip({Key? key}) : super(key: key);

  @override
  State<SoloFieldTrip> createState() => _SoloFieldTripState();
}

class _SoloFieldTripState extends State<SoloFieldTrip> {

  final CollectionReference _trips =
  FirebaseFirestore.instance.collection('trips');
  @override
  Widget build(BuildContext context) {
  final size=AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text('Fieldtrips')),
          backgroundColor: Colors.lightGreen,
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            width: (size.width>600)? 700 : size.width*0.9,
            child: StreamBuilder(
              stream: _trips.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                      final size=AppLayout.getSize(context);
                      return 
                      Container(
      width: size.width*0.6,
      height: 340,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 17),
      margin: const EdgeInsets.only(right: 17,top: 20,left: 17),
      decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20,
                spreadRadius: 5,
              )
            ]
      ),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Styles.primaryColor,
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(documentSnapshot['images'][0]))
                ),
              )
            ,
            const Gap(10),
            InkWell(child: Text(documentSnapshot['title'], 
            style: Styles.headLineStyle2,), onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>
                            SepFieldTrips(documentSnapshot: documentSnapshot)) );
                            },
                            ),
                    const Gap(5),
            Text(documentSnapshot['subtitle'].toString(), style: Styles.headLineStyle3,),
            ],
      ),
    );
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
    );
  }
}
