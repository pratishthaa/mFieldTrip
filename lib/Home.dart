import 'package:mfieldtrip/Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
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

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

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
                    "${user.displayName}",
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
                      "${user.email}",
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
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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
