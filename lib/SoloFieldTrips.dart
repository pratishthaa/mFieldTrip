import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mfieldtrip/SepFieldTrips.dart';

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
    return Scaffold(
      backgroundColor: Colors.lime[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text('Fieldtrips')),
          backgroundColor: Colors.lightGreen,
        ),
        body: StreamBuilder(
          stream: _trips.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: InkWell(child: Text(documentSnapshot['title']), onTap:()=>
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SepFieldTrips(documentSnapshot: documentSnapshot))),),
                      // title: InkWell(child: Text(documentSnapshot['title']), onTap: navigateToSepFieldTrip,),
                      // title: Text(documentSnapshot['title']),
                      subtitle: Text(documentSnapshot['subtitle'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          // children: [
                          //   IconButton(
                          //       icon: const Icon(Icons.edit),
                          //       onPressed: () =>
                          //           _update(documentSnapshot)),
                          //   IconButton(
                          //       icon: const Icon(Icons.delete),
                          //       onPressed: () =>
                          //           _delete(documentSnapshot.id)),
                          // ],
                        ),
                      ),
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
// Add new product
//         floatingActionButton: FloatingActionButton(
//           // onPressed: () => _create(),
//           child: const Icon(Icons.add),
//
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}



// class SoloFieldTrip extends StatelessWidget {
//   const SoloFieldTrip({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         children: [],
//       ),
//     );
//   }
// }
