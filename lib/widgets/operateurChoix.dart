import 'package:flutter/material.dart';
import 'package:siteweb/constant.dart';

class OperateurChoix extends StatelessWidget {
  OperateurChoix();
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Expanded(child: new TextField(controller: controller)),
        new PopupMenuButton<String>(
          icon: const Icon(Icons.arrow_drop_down),
          onSelected: (String value) {
            controller.text = value;
          },
          itemBuilder: (BuildContext context) {
            return operateur.map<PopupMenuItem<String>>((String value) {
              return new PopupMenuItem(child: new Text(value), value: value);
            }).toList();
          },
        ),
      ],
    );
  }
}
