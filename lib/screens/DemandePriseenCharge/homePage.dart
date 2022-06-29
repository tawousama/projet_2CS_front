import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:siteweb/screens/DemandePriseenCharge/Body.dart';

class HomePage extends StatelessWidget {
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
      body: PriseenCharge(),
    );
  }
}
