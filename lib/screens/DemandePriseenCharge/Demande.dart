import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../../constant.dart';
import '../../models/Demande.dart';

class DemandeDetail extends StatelessWidget {
  final Demande demande = demandes[0];
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
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
        body: ListView(
          children: [
            Text("Nom: ${demande.nom}"),
            Text("Nom: ${demande.prenom}"),
            Text("Prenom: ${demande.nss}"),
            Text("Catégorie de vehicule: ${demande.categorie_vehicule}"),
            Text("Adresse de structure de soin: ${demande.adresse_soin}"),
            Text("Adresse du patient: ${demande.adresse_assure}"),
            TextButton(
              child: Text("retour"),
              onPressed: () {},
            )
          ],
        ));
  }
}
