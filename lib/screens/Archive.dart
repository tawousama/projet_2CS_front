import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class Archive extends StatelessWidget {
  const Archive({Key? key}) : super(key: key);

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
          ),
          AdminMenuItem(
            title: 'Remboursement',
            route: '/remboursement',
            icon: Icons.file_copy,
          ),
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
      body: Container(),
    );
  }
}
