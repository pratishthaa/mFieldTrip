import 'package:flutter/material.dart';

class CreateFieldTrip extends StatefulWidget {
  const CreateFieldTrip({Key? key}) : super(key: key);

  @override
  State<CreateFieldTrip> createState() => _CreateFieldTripState();
}

class _CreateFieldTripState extends State<CreateFieldTrip> {
  late String ftitle,subtitle, author, category,description, distance,visitperiod,level,duration;
  // String tripoffered='Athabasca University';
  // var tripofferedby=[
  //   'Athabasca University',
  //   'University of Calgary',
  //   'University of Biritish Columbia',
  //   'Add Custom Organization Name',
  // ];
  // String visitperiod = 'All year';
  final List<String> tripofferedby = [
    'Athabasca University',
      'University of Calgary',
      'University of Biritish Columbia',
      'Add Custom Organization Name',
  ];
  String? tripoffered;

  // List of items in our dropdown menu
  // String level='Primary and Secondary Education(K-12)';
  // var levels = [
  //   'Primary and Secondary Education(K-12)',
  //   'Post Secondary Education(UG LEVEL)',
  //   'Post Secondary Education(PG LEVEL)',
  // ];
  // var items = [
  //   'All year',
  //   'Summer',
  //   'Spring',
  //   'Winter',
  //   'Fall',
  // ];
  // String duration='One day or less';
  // var durations=[
  //   'One day or less',
  //   'two to four days',
  //   'more than four days',
  // ];
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
            child: Text('Create FieldTrip',style:
            TextStyle(fontSize: 30.0),),
          ),backgroundColor: Colors.lightGreen,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter title here',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          ftitle = (val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter Subtitle here',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        maxLines: 4,
                        onChanged: (val) {
                          subtitle = (val);
                        },
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            'Trip Offered by',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme
                                  .of(context)
                                  .hintColor,
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
                          buttonWidth: 140,
                          itemHeight: 40,
                        ),
                      ),
                      // TextField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Trip Offered by',
                      //     labelStyle: TextStyle(
                      //       fontWeight: FontWeight. bold,
                      //       fontSize: 20.0,
                      //     ),
                      //   ),
                      //   onChanged: (val) {
                      //     tripoffered = (val);
                      //   },
                      // ),

                      // DropdownButton(
                      //
                      //   // Initial Value
                      //   value: tripoffered,
                      //
                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //
                      //   // Array list of items
                      //   items: items.map((String tripofferedby) {
                      //     return DropdownMenuItem(
                      //       value: tripofferedby,
                      //       child: Text(tripofferedby),
                      //     );
                      //   }).toList(),
                      //
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       tripoffered = newValue!;
                      //     });
                      //   },
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Author(s)',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          author = (val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Level',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          level = (val);
                        },
                      ),
                      // DropdownButton(
                      //
                      //   // Initial Value
                      //   value: level,
                      //
                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //
                      //   // Array list of items
                      //   items: items.map((String levels) {
                      //     return DropdownMenuItem(
                      //       value: levels,
                      //       child: Text(levels),
                      //     );
                      //   }).toList(),
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       level = newValue!;
                      //     });
                      //   },
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          category = (val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        maxLines: 6,
                        onChanged: (val) {
                          description = (val);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Duration',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          duration = (val);
                        },
                      ),
                      // DropdownButton(
                      //
                      //   // Initial Value
                      //   value: duration,
                      //
                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //
                      //   // Array list of items
                      //   items: items.map((String durations) {
                      //     return DropdownMenuItem(
                      //       value: durations,
                      //       child: Text(durations),
                      //     );
                      //   }).toList(),
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       duration = newValue!;
                      //     });
                      //   },
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Distance',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          distance = (val);
                        },
                      ),
                      // DropdownButton(
                      //
                      //   // Initial Value
                      //   value: visitperiod,
                      //
                      //   // Down Arrow Icon
                      //   icon: const Icon(Icons.keyboard_arrow_down),
                      //
                      //   // Array list of items
                      //   items: items.map((String items) {
                      //     return DropdownMenuItem(
                      //       value: items,
                      //       child: Text(items),
                      //     );
                      //   }).toList(),
                      //   // After selecting the desired option,it will
                      //   // change button value to selected value
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       visitperiod = newValue!;
                      //     });
                      //   },
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Visiting Period',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight. bold,
                            fontSize: 20.0,
                          ),
                        ),
                        onChanged: (val) {
                          visitperiod = (val);
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.black,),
                          //color: Colors.blue,
                          onPressed: () async {
                            // var body = [
                            //   {
                            //     "title": title,
                            //     "subtitle": ,
                            //     "duration": hypertension,
                            //     "visitingperiod": heart_disease,
                            //     "distance":work_type,
                            //     "elevel": avg_glucose_leve,
                            //     "bmi": bmi,
                            //   }
                            // ];
                            // print(body);
                            // var resp = await predict(body);
                            // _onBasicAlertPressed(context, resp);
                          },
                          child: Text("Create"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],

      ),
    );
  }
}
