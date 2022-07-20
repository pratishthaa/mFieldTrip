import 'package:flutter_map/flutter_map.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mfieldtrip/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:geocoder2/geocoder2.dart';
import 'CreateFieldTrip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isloggedin = false;
  // final Completer<GoogleMapController> _controller=Completer();
  // static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(33.6864,73.0479),
  // zoom:14,
  // );
  //
  // final List<Markers> _markers =const <Markers>[
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(33.6864, 73.0479),
  //     infoWindow: InfoWindow(
  //       title: 'The title of the marker'
  //     )
  //   )
  // ];
  LatLng point=LatLng(49.5, -0.09);
  GeoData? location;
  checkAuthentification() async {
    _auth.authStateChanges().listen((fuser) {
      user=fuser;
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser!;
        this.isloggedin = true;
      });
    }
  }

  // getProfileImage() async{
  //   if(_auth.currentUser!.photoURL!= null)
  //     {
  //       return Image.network(_auth.currentUser?.photoURL,height: 100,width: 100);
  //     }
  //   else{
  //     return Icon(Icons.account_circle,size:100);
  //   }
  // }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }
  navigateToCreateFieldTrip() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateFieldTrip()));
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    // super.initState();
    // getUser().whenComplete((){
    //   setState(() {});
    // });
  }
  // @override
  // void initState() {
  //   name = "Flutter Campus";
  //   super.initState();
  // }

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
      // body: GoogleMap(
      //   initialCameraPosition: _kGooglePlex,
      //     markers: Set<Marker>.of(_markers),
      //   onMapCreated: (GoogleMapController controller){
      //     _controller.complete(controller);
      //   }
      // ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
            onTap: (p, point) async {
              location = await Geocoder2.getDataFromCoordinates(
                  latitude: point.latitude, longitude: point.longitude, googleMapApiKey: 'AIzaSyC2S0anL4zRhImALsWNMuGa-5nhnAQWqwA');
            print("${location?.country}");
              setState((){
                point=p as LatLng;
              });
            },
            center: LatLng(49.5, -0.09),
            zoom: 10.0
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a','b','c'],
            ),
            MarkerLayerOptions(markers: [
              Marker(
                  width:100.0,
                  height:100.0,
                  point: point, builder: (ctx)=> Icon(
                Icons.location_on, color: Colors.red,
                size:40.0,
              )),
            ],
            ),

          ],
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 34.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_outlined),
                      hintText: "Search for location",
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                Card(child: Padding(
                  padding: EdgeInsets.all(16.0),
    // child: Text("new location",
    child: Text("${location?.country}, ${location?.city}, ${location?.state}",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ),)
              ],
            ),)
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 20),
            Container(

              height: 150,
              child:
                Icon(Icons.account_circle, size:100),
              // Image(
                // image: ${user.displayImage},
              //   image: AssetImage("images/logo.png"),
              //   fit: BoxFit.contain,
              //   width:200,
              //   height:200,
              // ),
            ),
        Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${user?.displayName}",
                      // "${user.email}",
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  // "${user.displayName}"
                      "${user?.email}",
                  style:
                  TextStyle(fontSize: 10.0),
                ),
              ),
            ),
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
            ListTile(
              title: const Text('Create FieldTrip'),
              onTap: navigateToCreateFieldTrip,
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
              },
            ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RaisedButton(
            // padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            onPressed: signOut,
            child: Text('Signout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            color: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),],
        ),
      ),
    );
  }
}
//         body: Container(
//           child: !isloggedin
//               ? CircularProgressIndicator()
//               : Column(
//             children: <Widget>[
//               SizedBox(height: 40.0),
//               Container(
//                 height: 300,
//                 child: Image(
//                   image: AssetImage("images/logo.png"),
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Container(
//                 child: Text(
//                   "Hello ${user.displayName} you are Logged in as ${user.email}",
//                   style:
//                   TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                 ),
//               ),

//               )
//             ],
//           ),
//         ));
//   }
// }
