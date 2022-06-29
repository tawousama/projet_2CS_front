import 'package:flutter/material.dart';
import 'package:siteweb/constant.dart';
import 'package:siteweb/widgets/itemlist.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/Demande.dart';

class PriseenCharge extends StatefulWidget {
  @override
  State<PriseenCharge> createState() => _PriseenChargeState();
}

class _PriseenChargeState extends State<PriseenCharge> {
  DateTime selectedDay = DateTime.now();

  List<CleanCalendarEvent> selectedEvents = [];

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent(
        "eventA",
        startTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        endTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 3),
        description: "test de demande",
        color: Colors.blue,
      ),
    ]
  };

  //list tomporraire pour tester l'interface
  List dem = demandes;

  List<Demande> initDemandes() {
    return List.generate(5, (int index) {
      return Demande(
          demande_num: index,
          date: DateTime.now(),
          etat: "en attente",
          adresse_assure: "",
          adresse_soin: "",
          nom: "",
          prenom: "",
          categorie_vehicule: Categorie_vehicule.vsl.toString(),
          nss: "",
          nomOperateur: "",
          detail: TextButton(
            onPressed: () {},
            child: Text("Voir les details"),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(width: 1.0, color: Colors.blueAccent)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ));
    });
  }

  void _handleDate(date) {
    setState(() {
      selectedDay = date;
      selectedEvents = events[selectedDay] ?? [];
    });
  }

  /*Future<void> getDemandes() async {
    var uri=Uri.http("http://kjbh")
    var res = await http.get("http://kjbh");
    if (res.statusCode == 200) {
      var jsonObj = jsonDecode(res.body);
    }
  }*/

  @override
  void initState() {
    selectedEvents = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initDemandes();
    return Container(
      //color: Colors.blue,
      height: 100000,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3.0,
              ),
              Container(
                color: primColor,
                height: 50,
                width: 500,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: const Text(
                        "Demande N°",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 125,
                      child: const Text(
                        "Date",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 125,
                      child: const Text(
                        "Etat",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      width: 150,
                      child: const Text(
                        "Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const ItemList(),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/CreerDemande");
                },
                child: Text("Creer une demande"),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(width: 1.0, color: Colors.blueAccent)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
            width: 300,
            child: Expanded(
              child: Calendar(
                startOnMonday: true,
                selectedColor: Colors.blue,
                todayColor: Colors.blueGrey,
                eventColor: Colors.green[400],
                eventDoneColor: Colors.orange[400],
                bottomBarColor: Colors.deepOrange,
                onRangeSelected: (range) {
                  print("selected day ${range.from}.${range.to}");
                },
                onDateSelected: (date) {
                  return _handleDate(date);
                },
                events: events,
                isExpanded: true,
                dayOfWeekStyle: TextStyle(
                  fontSize: 10,
                ),
                bottomBarTextStyle: TextStyle(color: Colors.black),
                weekDays: ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"],
                hideBottomBar: false,
                hideArrows: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
