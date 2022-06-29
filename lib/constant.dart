import 'package:flutter/material.dart';

import 'models/Demande.dart';

enum Etat { en_attente, envoyee, acceptee }
enum Categorie_vehicule { vsl, ambulance_m, ambulance_s }
const primColor = Color(0xFFFF083454);
const kdecoTextForm = InputDecoration(
  hintStyle: TextStyle(fontSize: 16.0),
  filled: true,
  fillColor: Colors.white12,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const List<String> operateur = [
  'ambulance SOS',
  'Alger Ambulance',
  'Oran Ambulance',
  'Enadjda'
];
List<Demande> demandes = [];

int index = 0;
