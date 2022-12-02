import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mfieldtrip/utils/app_layout.dart';
import 'package:mfieldtrip/utils/app_styles.dart';
import 'package:mfieldtrip/widgets/multiple_selection.dart';
import 'package:uuid/uuid.dart';
import 'package:dotted_border/dotted_border.dart';


class CreateFieldTrip extends StatefulWidget {
  const CreateFieldTrip({Key? key}) : super(key: key);

  @override
  State<CreateFieldTrip> createState() => _CreateFieldTripState();
}

class _CreateFieldTripState extends State<CreateFieldTrip> {

  @override
    List<Widget> itemPhotosWidgetList = <Widget>[];

  String? ftitle,subtitle, author,description;
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
    List<String> _VisitPeriods = [];

  void _showVisitPeriodOptions() async {
  final List<String> periods = [
    'All year',
      'Summer',
      'Spring',
      'Winter',
      'Fall',
  ];
  final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultipleSelection(items: periods);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _VisitPeriods = results;
      });
    }
  }

  bool isChecked = false;
  bool isLimited=false;
  bool isProtected=false;
  bool isCharged=false;

  final ImagePicker _picker = ImagePicker();
  File? file;
  List<XFile>? photo = <XFile>[];
  List<XFile> itemImagesList = <XFile>[];

  List<String> downloadUrl = <String>[];

  bool uploading = false;

  addFirebaseImages(PickedFile? pickedFile, String productId)async{
      String? pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/$productId/image_$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String value = await reference.getDownloadURL();
    downloadUrl.add(value);
  }


  addFieldtrip() async{
        String? pId = const Uuid().v4();
      String ImgId=DateTime.now().microsecondsSinceEpoch.toString();
    await FirebaseFirestore.instance.collection('trips').doc(pId).set({
      "id": pId,
      "title": ftitle,
      "subtitle": subtitle,
      "trip offered by":tripoffered,
      "author":author,
      "level": level,
      "category":category,
      "description":description,
      "duration": duration,
      "distance":distance,
      "visiting period": _VisitPeriods,
      "need author display":isChecked,
      "is access limited" :isLimited,
      "park or protected area":isProtected,
      "any fees":isCharged,
      "images":downloadUrl,
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
    _VisitPeriods=[];
    isChecked=false;
    isLimited=false;
    isProtected=false;
    isCharged=false;
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
    final size=AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: primary,
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
      body: Center(
        child: Container(
          color: Colors.white,
          width: (size.width>600)? 700 : size.width*0.9,
          
          child: ListView(
            shrinkWrap: true,
            // fit: StackFit.expand,
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
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
                          child: Row(
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
                                     Text(
                                      'Check to display Author information',
                                      style: Styles.headLineStyle3.copyWith(color: Colors.black),)
                                ],
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
                        
          
                       
                        Padding(padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Limited Access', style: Styles.headLineStyle2,),
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
                                  Text(
                                    'Check if one site or more stops may not be accessible at all times of the day or year.',
                                    style: Styles.headLineStyle4.copyWith(color: Colors.black),),
                              ],
                            )
                          ],
                        ),
                        ),
                        Padding(padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Park or Protected Area', style: Styles.headLineStyle2,),
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
                                  Text(
                                    'Check if one or more stops are located within a park, or reserve, or any other protected area.',
                                    style: Styles.headLineStyle4.copyWith(color: Colors.black),)
                              ],
                            ),
                          ],
                        ),
                        ),
                        Padding(padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text('Entrance or Admission Fees', style: Styles.headLineStyle2,),
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
                                  Text(
                                    'Check if one or more stops have entrance/admission fees.',
                                    style: Styles.headLineStyle4.copyWith(color: Colors.black),)
                              ],
                            )
                          ],
                        ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // use this button to open the multi-select dialog
                              ElevatedButton(
                                onPressed: _showVisitPeriodOptions,
                                style: ElevatedButton.styleFrom(side: BorderSide(width: 2, color: Colors.black,), backgroundColor: Colors.white),
                                child:  Text('Select Visiting Periods', style: Styles.headLineStyle4.copyWith(color: Colors.black),),
                              ),
                              // const Gap(3),
                              const Divider(
                                height: 10,
                              ),
                              // display selected items
                              Wrap(
                                children: _VisitPeriods
                                    .map((e) => Chip(
                                          label: Text(e),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              itemPhotosWidgetList.isEmpty
                  ? 
                  // Center(
                  //     child: MaterialButton(
                  //       onPressed: pickPhotoFromGallery,
                  //       child: Container(
                  //         alignment: Alignment.bottomCenter,
                  //         child: Center(
                  //           child: Image.network(
                  //             "https://static.thenounproject.com/png/3322766-200.png",
                  //             height: 100.0,
                  //             width: 100.0,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  dottedBorder(color: Colors.black)
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Wrap(
                        spacing: 5.0,
                        direction: Axis.horizontal,
                        children: itemPhotosWidgetList,
                        alignment: WrapAlignment.spaceEvenly,
                        runSpacing: 10.0,
                      ),
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
                               upload();
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
        ),
      ),
    );
  }

    addImage() {
    for (var bytes in photo!) {
      itemPhotosWidgetList.add(Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          height: 90.0,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              child: kIsWeb
                  ? Image.network(File(bytes.path).path)
                  : Image.file(
                      File(bytes.path),
                    ),
            ),
          ),
        ),
      ));
    }
  }

  pickPhotoFromGallery() async {
    photo = await _picker.pickMultiImage();
    if (photo != null) {
      setState(() {
        itemImagesList = itemImagesList + photo!;
        addImage();
        photo!.clear();
      });
    }
  }

  upload() async {
    String productId = await uplaodImageAndSaveItemInfo();
    setState(() {
      uploading = false;
    });
    // showToast("Image Uploaded Successfully");
  }

  Future<String> uplaodImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });
    PickedFile? pickedFile;
    String? productId = const Uuid().v4();
    for (int i = 0; i < itemImagesList.length; i++) {
      file = File(itemImagesList[i].path);
      pickedFile = PickedFile(file!.path);

      await addFirebaseImages(pickedFile, productId);
    }
    await addFieldtrip();
    return productId;
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
                      pickPhotoFromGallery();
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