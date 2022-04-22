import 'package:flutter/material.dart';
import 'package:health_pets/widgets/diario/diario-card.widget.dart';

class DiarioList extends StatefulWidget {
  const DiarioList({Key? key}) : super(key: key);

  @override
  _DiarioListState createState() => _DiarioListState();
}

class _DiarioListState extends State<DiarioList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      //itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          child: DiarioCard(),
        );
      },
    );
  }
}
