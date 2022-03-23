import 'package:flutter/material.dart';
import 'package:health_pets/controllers/especie_controller.dart';

class TesteApi extends StatefulWidget {
  const TesteApi({Key? key}) : super(key: key);

  @override
  State<TesteApi> createState() => _TesteApiState();
}

class _TesteApiState extends State<TesteApi> {
  final controller = EspecieController();

  _success() {
    return ListView.builder(
      itemCount: controller.especies.length,
      itemBuilder: (context, index) {
        var especie = controller.especies[index];
        return ListTile(
          title: Text(especie.descricao),
          //title: Text('item $index'),
        );
      },
    );
  }

  _error() {
    return Center(
      child: TextButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tente novamente'),
      ),
    );
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(EspecieState state) {
    switch (state) {
      case EspecieState.start:
        return _start();
      case EspecieState.loading:
        return _loading();
      case EspecieState.success:
        return _success();
      case EspecieState.error:
        return _error();
      default:
        return _start();
    }
  }

  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste API"),
        actions: [
          IconButton(
              onPressed: () {
                controller.start();
              },
              icon: Icon(Icons.refresh_outlined))
        ],
      ),
      // "escuta" a reatividade
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
