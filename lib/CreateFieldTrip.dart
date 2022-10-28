import 'dart:io';
// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:dotted_border/dotted_border.dart';


class CreateFieldTrip extends StatefulWidget {
  const CreateFieldTrip({Key? key}) : super(key: key);

  @override
  State<CreateFieldTrip> createState() => _CreateFieldTripState();
}

class _CreateFieldTripState extends State<CreateFieldTrip> {

  @override

  String? ftitle,subtitle, author,description, imageUrl;
  String? distance;
  String? tripoffered;
  final List<String> tripofferedby = [
    'Athabasca University',
      'University of Calgary',
      'University of Biritish Columbia',
      'Some other',
  ];
  String? level;
  final List<String> levels = [
    'Primary and Secondary Education(K-12)',
      'Post Secondary Education(UG LEVEL)',
      'Post Secondary Education(PG LEVEL)',
  ];
  String? category;
  final List<String> categories = [
    'Applied Sciences and Technology',
    'Social Sciences and Humanities',
    'Life Sciences',
    'Physical Sciences',
    'Others',

  ];
  String? duration;
  final List<String> durations = [
    'One day or less',
      'two to four days',
      'more than four days',
  ];
  String? visitingeriod;
  final List<String> periods = [
    'All year',
      'Summer',
      'Spring',
      'Winter',
      'Fall',
  ];

  bool isChecked = false;
  bool isLimited=false;
  bool isProtected=false;
  bool isCharged=false;
  
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  


  void addFieldtrip() async{
    if (_pickedImage == null) {
      print("Pick image");
        // GlobalMethods.errorDialog(
        //     subtitle: 'Please pick up an image', context: context);
        return;
      }
      final _uuid = const Uuid().v4();
      String ImgId=DateTime.now().microsecondsSinceEpoch.toString();
      Reference refe=FirebaseStorage.instance.ref().child('images').child(_uuid + 'jpg');
      final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': _pickedImage!.path},
    );
        final TaskSnapshot snapshot;
        if (kIsWeb) {
      snapshot = await refe.putData(webImage);
    } else {
      snapshot = await refe.putFile(_pickedImage!);
    }
 
      String imageUri = await snapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('trips').doc(_uuid).set({
      "id": _uuid,
      "title": ftitle,
      "subtitle": subtitle,
      "trip offered by":tripoffered,
      "author":author,
      "level": level,
      "category":category,
      "description":description,
      "duration": duration,
      "distance":distance,
      "visiting period": visitingeriod,
      "need author display":isChecked,
      "is access limited" :isLimited,
      "park or protected area":isProtected,
      "any fees":isCharged,
      "images":imageUri,
      "created at":ImgId,
    });
     _clearForm();
        Fluttertoast.showToast(
          msg: "FieldTrip Added Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
}

 void _clearForm() {
    ftitle="";
    subtitle="";
    tripoffered='Athabasca University';
    author="";
    level='Primary and Secondary Education(K-12)';
    category='Applied Sciences and Technology';
    description="";
    duration='One day or less';
    distance="";
    visitingeriod='All year';
    isChecked=false;
    isLimited=false;
    isProtected=false;
    isCharged=false;
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  


  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.lightGreen;
      }
      return Colors.lightGreen;
    }
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Create FieldTrip', style:
            TextStyle(fontSize: 20.0),),
          ), backgroundColor: Colors.lightGreen,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // fit: StackFit.expand,
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        // controller: _ftitlecontroller,
                        decoration: InputDecoration(
                          labelText: 'Enter title here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        onChanged: (val) {
                          ftitle = (val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Subtitle here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        maxLines: 4,
                        // expands: true,
                        onChanged: (val) {
                          subtitle = (val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              'Trip Offered by',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                          ),
                          items: tripofferedby
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                          value: tripoffered,
                          onChanged: (value) {
                            setState(() {
                              tripoffered = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 240,
                          itemHeight: 40,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Author(s)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        onChanged: (val) {
                          author = (val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              'Level',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                          ),
                          items: levels
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                          value: level,
                          onChanged: (value) {
                            setState(() {
                              level = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 240,
                          itemHeight: 40,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                          ),
                          items: categories
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                          value: category,
                          onChanged: (value) {
                            setState(() {
                              category = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 240,
                          itemHeight: 40,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              const Text('Check to display Author information')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        maxLines: 6,
                        // expands:true,
                        onChanged: (val) {
                          description = (val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              'Duration',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                          ),
                          items: durations
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                          value: duration,
                          onChanged: (value) {
                            setState(() {
                              duration = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 240,
                          itemHeight: 40,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Distance(KM)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.lightGreen,
                              width: 2.0,
                            ),),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        onChanged: (val) {
                          distance = val;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Colors.lightGreen,
                                width: 2.0,
                              ),),
                          ),
                          hint: Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Text(
                              'Visiting Period',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                  color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                          ),
                          items: periods
                              .map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                              .toList(),
                          value: visitingeriod,
                          onChanged: (value) {
                            setState(() {
                              visitingeriod = value as String;
                            });
                          },
                          buttonHeight: 40,
                          buttonWidth: 240,
                          itemHeight: 40,
                        ),
                      ),
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const Text('Limited Access'),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isLimited,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isLimited = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Check if one site or more stops may not be accessible at all times of the day or year.',
                                style: TextStyle(fontSize: 6.5),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const Text('Park or Protected Area'),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isProtected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isProtected = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Check if one or more stops are located within a park, or reserve, or any other protected area.',
                                style: TextStyle(fontSize: 6.5),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          const Text('Entrance or Admission Fees'),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    getColor),
                                value: isCharged,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCharged = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Check if one or more stops have entrance/admission fees.',
                                style: TextStyle(fontSize: 6.5),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _pickedImage == null
                                            ? dottedBorder(color: Colors.black)
                                            : ClipRRect(
                                               borderRadius:
                                                    BorderRadius.circular(12),
                                                child: kIsWeb
                                                    ? Image.memory(webImage,
                                                        fit: BoxFit.fill)
                                                    : Image.file(_pickedImage!,
                                                        fit: BoxFit.fill),
                                              ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,),
                        //color: Colors.blue,
                        onPressed: () {
                          addFieldtrip();
        
                          // showDialog<String>(
                          //   context: context,
                          //   builder: (BuildContext context) =>
                          //       AlertDialog(
                          //         title: const Text('Fieldtrip form'),
                          //         content: const Text(
                          //             'This fieldtrip is created successfully'),
                          //         actions: <Widget>[
                          //           TextButton(
                          //             onPressed: () =>
                          //                 Navigator.pop(context, 'OK'),
                          //             child: const Text('OK'),
                          //           ),
                          //         ],
                          //       ),
                          // );
                        },
                        child: Text("Click to Create"),
                      ),
                    ),
                  ],
                ),
              ),
        
            ),
          ),

        ],
      ),
    );
  }


Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

Widget dottedBorder({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage();
                    }),
                    child: Text(
                      'Choose an image',
                      // style: color,
                      // color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}