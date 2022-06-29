import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:siteweb/constant.dart';

import '../../models/Demande.dart';

class CreerDemande extends StatefulWidget {
  const CreerDemande({Key? key}) : super(key: key);

  @override
  State<CreerDemande> createState() => _CreerDemandeState();
}

class _CreerDemandeState extends State<CreerDemande> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Demande demande = initDemande();
  Demande initDemande() {
    return Demande(
      demande_num: demandes.length + 1,
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
        onPressed: () {
          Navigator.of(context).pushNamed("/detaildemande");
        },
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdminScaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('CNAS'),
        ),
        sideBar: SideBar(
          items: const [
            AdminMenuItem(
                title: 'Demandes de prises en charge',
                route: '/',
                icon: Icons.sticky_note_2_outlined,
                children: [
                  AdminMenuItem(
                    title: 'Demandes',
                    route: '/',
                  ),
                  AdminMenuItem(
                    title: 'Creer une demande',
                    route: '/CreerDemande',
                  ),
                ]),
            AdminMenuItem(
                title: 'Remboursement',
                route: '/remboursement',
                icon: Icons.file_copy,
                children: [
                  AdminMenuItem(
                    title: 'Remboursements',
                    route: '/remboursement',
                  ),
                  AdminMenuItem(
                    title: 'Creer une demande de remboursement',
                    route: '/CreerRemboursement',
                  ),
                ]),
            AdminMenuItem(
              title: 'Deplacements',
              route: '/Deplacements',
              icon: Icons.tour_outlined,
            ),
            AdminMenuItem(
              title: 'Parametres',
              route: '/Parametres',
              icon: Icons.settings,
            ),
            AdminMenuItem(
              title: 'Archive',
              route: '/Archive',
              icon: Icons.archive,
            ),
          ],
          selectedRoute: '/',
          onSelected: (item) {
            if (item.route != null) {
              Navigator.of(context).pushNamed(item.route!);
            }
          },
        ),
        body: Container(
          child: Container(
            width: 500,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Entrer un nom';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        demande.nom = value;
                      },
                      decoration:
                          kdecoTextForm.copyWith(hintText: "Nom Patient")),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer un prenom';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.prenom = value;
                    },
                    decoration:
                        kdecoTextForm.copyWith(hintText: "Prenom Patient"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer un NSS valide';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.nss = value;
                    },
                    decoration: kdecoTextForm.copyWith(hintText: "NSS Assuré"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer un operateur';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.nomOperateur = value;
                    },
                    decoration:
                        kdecoTextForm.copyWith(hintText: "Operateur Choisi"),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer une adresse';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.adresse_soin = value;
                    },
                    decoration: kdecoTextForm.copyWith(
                        hintText: "Adresse structure de soin"),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer une adresse du patient';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.adresse_assure = value;
                    },
                    decoration:
                        kdecoTextForm.copyWith(hintText: "Adresse du patient"),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer une categorie';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.categorie_vehicule = value;
                    },
                    decoration: kdecoTextForm.copyWith(
                        hintText: "Categorie de vehicule"),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Entrer une date';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      demande.date = value as DateTime;
                    },
                    decoration: kdecoTextForm.copyWith(
                        hintText: "Categorie de vehicule"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          demandes.add(demande);
                          Navigator.of(context).pushNamed("/demandes");
                        }
                      });
                    },
                    child: Text(
                      "Valider la demande",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
