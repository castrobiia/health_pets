import 'package:flutter/material.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:health_pets/widgets/widgets.dart';

class EditarUsuario extends StatefulWidget {
  const EditarUsuario({Key? key}) : super(key: key);

  @override
  _EditarUsuarioState createState() => _EditarUsuarioState();
}

class _EditarUsuarioState extends State<EditarUsuario> {
  @override
  var conexao;
  initState() {
    setState(() {
      conexao = UsuarioRepository().getUsuario();
    });
    super.initState();
  }

  var nome, email;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Editar Perfil',
          style: TextStyle(
            color: ColorTheme.salmao1,
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: 30,
          ),
          child: FutureBuilder<dynamic>(
            future: conexao,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                    child: Container(child: CircularProgressIndicator()));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    child: Text(AppLocalizations.of(context)!.errorLoading),
                  ),
                );
              }

              final usuario = snapshot.data["user"];
              nomeController.text = usuario['nome'];
              emailController.text = usuario['email'];

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      controller: nomeController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => nome = input!,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.name,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => email = input!,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.email,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: botaoRetangulo(),
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            var nome = nomeController.text;
                            var email = emailController.text;
                            var id = usuario['id'];

                            if (await UsuarioRepository()
                                    .putUsuario(id.toString(), nome, email) ==
                                200) {
                              exibirMensagem(
                                  context, 'Dados atualizados com sucesso');
                              setarMaterialPageRoute(context, PetPage());
                            } else {
                              exibirMensagem(
                                  context, 'N??o foi poss??vel alterar os dados');
                            }
                          }
                        },
                        child: textBotao(AppLocalizations.of(context)!.save),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
