import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';


import 'package:lab3_mis/Model/list_item.dart';

import 'adaptive_flat_button.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);
  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _naslovController = TextEditingController();
  late String naslov;
  late String data_vreme;

  void _submitData(){
    if (_naslovController.text.isEmpty) {
      return;
    }
    final vnesenNaslov = _naslovController.text;

    if (vnesenNaslov.isEmpty) {
      return;
    }

    final newItem = ListItem(id: nanoid(5), naslov: vnesenNaslov);
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _naslovController,
              decoration: InputDecoration(labelText: "Naslov"),
              onSubmitted: (_) => _submitData(),
            ),
            AdaptiveFlatButton("Dodaj", _submitData)
          ],
        ),
    );
  }
}
