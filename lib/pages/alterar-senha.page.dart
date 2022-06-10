import 'package:flutter/material.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlterarSenha extends StatefulWidget {
  const AlterarSenha({Key? key}) : super(key: key);

  @override
  _AlterarSenhaState createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  @override
  var conexao;
  initState() {
    setState(() {
      conexao = UsuarioRepository().getUsuario();
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();
  var _senha, _confirmacaoSenha;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.changePassword,
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

              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: senhaController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => _senha = input!,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            createInfoDialog(context);
                          },
                          icon: Icon(Icons.info),
                        ),
                        labelText: AppLocalizations.of(context)!.newPassword,
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
                      obscureText: true,
                      controller: confirmacaoSenhaController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => _confirmacaoSenha = input!,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context)!.confirmPassword,
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
                            var nome = usuario['nome'];
                            var email = usuario['email'];
                            var id = usuario['id'];
                            String senha = senhaController.text;
                            String confirmacaoSenha =
                                confirmacaoSenhaController.text;

                            print(senha);
                            print(confirmacaoSenha);

                            RegExp senhaExp = new RegExp(
                              r"^(?=.*[A-Z])(?=.*[!#@$%&])(?=.*[0-9])(?=.*[a-z]).{6,15}$",
                              caseSensitive: true,
                            );
                            bool resultado = senhaExp.hasMatch(senha);
                            if (resultado) {
                              if (senha.length < 8 &&
                                  confirmacaoSenha.length < 8) {
                                exibirMensagem(context,
                                    'A senha deve ter no mínimo 8 caracteres');
                              } else {
                                if (senha == confirmacaoSenha) {
                                  if (await UsuarioRepository().putUsuario(
                                          id.toString(), nome, email) ==
                                      200) {
                                    exibirMensagem(
                                        context, 'Senha alterada com sucesso');
                                    setarMaterialPageRoute(context, PetPage());
                                  } else {
                                    exibirMensagem(context,
                                        'Não foi possível alterar a senha');
                                  }
                                } else {
                                  exibirMensagem(context, 'Senhas diferentes');
                                }
                              }
                            } else {
                              exibirMensagem(
                                  context,
                                  AppLocalizations.of(context)!
                                      .passwordRequirements);
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
