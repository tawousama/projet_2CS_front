import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siteweb/constant.dart';

import '../models/Demande.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Demande> dem = demandes;
  /*List<Demande> _generateItems() {
    return List.generate(demandes.length, (int index) {
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
          ));
    });
  }*/

  @override
  void initState() {
    super.initState();
    setState(() {
      dem = demandes;
      //demandes = _generateItems();
    });
  }

  TableRow _buildTableRow(Demande item) {
    return TableRow(key: ValueKey(item.demande_num), children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.bottom,
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(item.demande_num.toString()),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              "${item.date.day}/${item.date.month}/${item.date.year}",
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.bottom,
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(item.etat.toString()),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(padding: const EdgeInsets.all(5), child: item.detail),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(color: Colors.black12, width: 1),
        outside: BorderSide(color: Colors.black12, width: 1),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
      defaultColumnWidth: IntrinsicColumnWidth(),
      columnWidths: const <int, TableColumnWidth>{
        0: const FixedColumnWidth(100),
        1: const FixedColumnWidth(125),
        2: const FixedColumnWidth(125),
        3: const FixedColumnWidth(150),
      },
      // textDirection: TextDirection.rtl,
      textBaseline: TextBaseline
          .alphabetic, // Pass this argument when using [TableCellVerticalAlignment.fill]
      children: demandes.map((item) => _buildTableRow(item)).toList(),
    );
  }
}
