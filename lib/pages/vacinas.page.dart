import 'package:flutter/material.dart';
import 'package:health_pets/pages/cadastro-vacina.page.dart';
import 'package:health_pets/pages/menu-vacina.page.dart';
import 'package:health_pets/widgets/vacina/tabela-vacina.widget.dart';

class VacinaPage extends StatelessWidget {
  const VacinaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF6BD87),
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DefaultTabController(
                child: CadastrarVacina(),
                length: 4,
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Vacinas"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
        actions: [
          PopupMenuButton<MenuItemVacina>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItensVacina.items.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabelaVacina(),
            ),
          ),
        ],
      ),
    );
  }
}
