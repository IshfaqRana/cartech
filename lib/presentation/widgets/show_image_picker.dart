import 'package:flutter/material.dart';

void showPicker(
  BuildContext context,
  List<ListTile> tiles,
) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: tiles.length,
              itemBuilder: (BuildContext context, int index) {
                final item = tiles[index];
                return item;
              }),
        );
      });
}
