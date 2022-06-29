import 'package:flutter/material.dart';
import '../constant.dart';

class Demande {
  Demande(
      {required this.demande_num,
      required this.nss,
      required this.nom,
      required this.prenom,
      required this.nomOperateur,
      required this.adresse_soin,
      required this.adresse_assure,
      required this.date,
      required this.etat,
      required this.categorie_vehicule,
      required this.detail});
  late final String nom;
  late final String prenom;
  late final String nss;
  late final String adresse_soin;
  late final String adresse_assure;
  late final String nomOperateur;
  late String categorie_vehicule = Categorie_vehicule.vsl.toString();
  late int demande_num;
  late DateTime date;
  late TextButton detail;
  late String etat = Etat.en_attente.toString();
}
