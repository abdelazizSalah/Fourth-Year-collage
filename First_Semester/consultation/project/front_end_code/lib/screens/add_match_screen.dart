import 'package:flutter/material.dart';
import 'package:front_end_code/widgets/common_appbar.dart';
import 'package:front_end_code/widgets/custom_snackbar.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});
  static const routeName = "/add_create_screen";
  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  int selectedIdx = -1;
  final reservedSeats = {};
  var stadiumName = "استاد القاهرة";
  final stadiumNames = [
    "استاد القاهرة",
    "ملعب مختار التتش",
    "ملعب نادي الشمس",
    "ستاد جهاز الرياضة العسكري",
    "ملعب الكلية الحربية",
    "ملعب السكة الحديد",
    "ملعب الإنتاج الحربي",
    "ملعب 30 يونيو",
    "ملعب بتروسبورت",
    "ملعب الزمالك",
    "ستاد السلام (مصر)",
  ];
  var clubName = "نادى الزمالك";
  var clubName2 = "نادى الزمالك";
  final clubNames = [
    "نادى العبور",
    "النادى الاسماعيلى",
    "نادى انبى",
    "نادى منية النصر الرياضى",
    "نادى الانتاج الحربى",
    "نادى البنك الاهلى المصرى",
    "نادى طهطا",
    "نادى بلقاس",
    "نادى اتحاد الشرطه",
    "الاتحاد السكندرى",
    "النادى الأهلى (مصر)",
    "نادى الجونه",
    "نادى مصر المقاصه (نادى)",
    "نادى الزرقا",
    "نادى الزمالك"
  ];

  Widget buildDropBoxTeams(bool horizontal, double textScaleFactor, int num) {
    if (horizontal) {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 550,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(children: [
                  Text(
                    "Team$num",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: DropdownButton<String>(
                      value: clubName,
                      dropdownColor: Colors.amber,
                      icon: const Icon(Icons.circle),
                      iconSize: 0,
                      elevation: 16,
                      alignment: Alignment.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RubikBubbles',
                          fontSize: 20 * textScaleFactor),
                      underline: Container(
                        height: 2,
                        color: Colors.amber,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          clubName = newValue!;
                        });
                      },
                      items: clubNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Icon(Icons.male, color: Colors.amber, size: 35 * textScaleFactor),
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: clubName,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        clubName = newValue!;
                      });
                    },
                    items:
                        clubNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      );
    }
  }

  Widget buildDropBoxTeams2(bool horizontal, double textScaleFactor, int num) {
    if (horizontal) {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 550,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Wrap(children: [
                  Text(
                    "Team$num",
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: DropdownButton<String>(
                      value: clubName2,
                      dropdownColor: Colors.amber,
                      icon: const Icon(Icons.circle),
                      iconSize: 0,
                      elevation: 16,
                      alignment: Alignment.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'RubikBubbles',
                          fontSize: 20 * textScaleFactor),
                      underline: Container(
                        height: 2,
                        color: Colors.amber,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          clubName2 = newValue!;
                        });
                      },
                      items: clubNames
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Icon(Icons.male, color: Colors.amber, size: 35 * textScaleFactor),
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: clubName2,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        clubName2 = newValue!;
                      });
                    },
                    items:
                        clubNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      );
    }
  }

  Widget buildDropBoxStadiums(bool horizontal, double textScaleFactor) {
    if (horizontal) {
      return Container(
        margin: EdgeInsets.only(left: 550, top: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Wrap(children: [
                Icon(Icons.square,
                    color: Colors.amber, size: 35 * textScaleFactor),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: DropdownButton<String>(
                    value: stadiumName,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.circle),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        stadiumName = newValue!;
                      });
                    },
                    items: stadiumNames
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(children: [
              Icon(Icons.male, color: Colors.amber, size: 35 * textScaleFactor),
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: stadiumName,
                    dropdownColor: Colors.amber,
                    icon: const Icon(Icons.no_sim_rounded),
                    iconSize: 0,
                    elevation: 16,
                    alignment: Alignment.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RubikBubbles',
                        fontSize: 20 * textScaleFactor),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        stadiumName = newValue!;
                      });
                    },
                    items: stadiumNames
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      );
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final textScaleFactor = mediaQuery.textScaleFactor;
    return Scaffold(
      appBar: const CustomAppBar(title: "Reservo"),
      body: Center(
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./assets/imgs/stadium_background.png'),
                fit: BoxFit.cover,
                opacity: 0.6,
              ),
              color: Colors.transparent),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: Center(
                    child: Text(
                  "Create a match!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: "RubikBubbles",
                      color: Colors.amber),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              buildDropBoxStadiums(true, textScaleFactor),
              const SizedBox(
                height: 20,
              ),
              buildDropBoxTeams(true, textScaleFactor, 1),
              const SizedBox(
                height: 20,
              ),
              buildDropBoxTeams2(true, textScaleFactor, 2),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),
                        ),
                        const SizedBox(
                          width: 60.0,
                        ),
                        Text("${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: "RubikBubbles",
                                color: Colors.amber)),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // here we should call the api which add new match.
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
