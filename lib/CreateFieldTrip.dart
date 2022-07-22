import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateFieldTrip extends StatefulWidget {
  const CreateFieldTrip({Key? key}) : super(key: key);

  @override
  State<CreateFieldTrip> createState() => _CreateFieldTripState();
}

class _CreateFieldTripState extends State<CreateFieldTrip> {
  // final _ftitlecontroller = TextEditingController();
  // final _subtitlecontroller = TextEditingController();
  // final _distancecontroller = TextEditingController();
  // final _durationcontroller = TextEditingController();
  // final _visitingperiodcontroller = TextEditingController();
  // final _levelcontroller = TextEditingController();
  // final _categorycontroller = TextEditingController();
  // final _authorcontroller = TextEditingController();
  // final _descriptioncontroller = TextEditingController();
  // final _tripofferedcontroller = TextEditingController();


  // final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  // void dispose() {
  //   _ftitlecontroller.dispose();
  //   _subtitlecontroller.dispose();
  //   _distancecontroller.dispose();
  //   _durationcontroller.dispose();
  //   _visitingperiodcontroller.dispose();
  //   _levelcontroller.dispose();
  //   _categorycontroller.dispose();
  //   _authorcontroller.dispose();
  //   _descriptioncontroller.dispose();
  //   _tripofferedcontroller.dispose();
  //
  //   super.dispose();
  // }

  String? ftitle,subtitle, author,description;
  String? distance;
  // late int distance;

  String? tripoffered;
  final List<String> tripofferedby = [
    'Athabasca University',
      'University of Calgary',
      'University of Biritish Columbia',
      'Add Custom Organization Name',
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

  Future addFieldtrip(String ftitle,String subtitle, String tripoffered,String author,String level,String category, String description,String duration, String distance, String visitingeriod,  bool isChecked, bool isLimited, bool isProtected,bool isCharged) async{
    await FirebaseFirestore.instance.collection('trips').add({
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
    });
}
// PlatformFile? pickedFile;
//   Future selectFile() async{
//     final result=await FilePicker.platform.pickFiles();
//     if(result==null)return;
// setState((){
//   pickedFile=result.files.first;
// });
//   }
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
            child: Text('Create FieldTrip',style:
            TextStyle(fontSize: 20.0),),
          ),backgroundColor: Colors.lightGreen,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [Center(
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
                          fontWeight: FontWeight. bold,
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
                          fontWeight: FontWeight. bold,
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
                              fontWeight: FontWeight. bold,
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
                          fontWeight: FontWeight. bold,
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
                              fontWeight: FontWeight. bold,
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
                              fontWeight: FontWeight. bold,
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
                        fillColor: MaterialStateProperty.resolveWith(getColor),
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
                          fontWeight: FontWeight. bold,
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
                              fontWeight: FontWeight. bold,
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
                          fontWeight: FontWeight. bold,
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
                              fontWeight: FontWeight. bold,
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
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isLimited,
                              onChanged: (bool? value) {
                                setState(() {
                                  isLimited = value!;
                                });
                              },
                            ),
                            const Text('Check if one site or more stops may not be accessible at all times of the day or year.', style: TextStyle(fontSize: 6.5),)
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
                      children:[
                      const Text('Park or Protected Area'),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isProtected,
                              onChanged: (bool? value) {
                                setState(() {
                                  isProtected = value!;
                                });
                              },
                            ),
                            const Text('Check if one or more stops are located within a park, or reserve, or any other protected area.', style: TextStyle(fontSize: 6.5),)
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
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isCharged,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCharged = value!;
                                });
                              },
                            ),
                            const Text('Check if one or more stops have entrance/admission fees.', style: TextStyle(fontSize: 6.5),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  // if(pickedFile!=null)
                  //   Expanded(child: Text(pickedFile!.name),
                  //   ),
                  // Padding(
                  //   padding: const EdgeInsets.all(13.0),
                  //   child: TextButton(onPressed: selectFile, child: Text('Select Image')),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.lightGreen,),
                      //color: Colors.blue,
                      onPressed: (){
                        addFieldtrip(ftitle!, subtitle!, tripoffered!, author!, level!, category!, description!, duration!, distance!, visitingeriod!, isChecked, isLimited, isProtected, isCharged);
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Fieldtrip form'),
                            content: const Text('This fieldtrip is created successfully'),
                            actions: <Widget>[
                              // TextButton(
                              //   onPressed: () => Navigator.pop(context, 'Cancel'),
                              //   child: const Text('Cancel'),
                              // ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
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
}
