import 'package:siteweb/constant.dart';
import 'package:flutter/material.dart';

class Transporteur {
  Transporteur(
      {required this.id, required this.password, required this.deplacement});
  final String id;
  final String password;
  final List<int> deplacement;
}
