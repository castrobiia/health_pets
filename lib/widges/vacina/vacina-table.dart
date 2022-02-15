class Vacina {
  final String nomeVacina;
  final String dataAplicacao;

  const Vacina({
    required this.nomeVacina,
    required this.dataAplicacao,
  });

  Vacina copy({
    String? nomeVacina,
    String? dataAplicacao,
  }) =>
      Vacina(
        nomeVacina: nomeVacina ?? this.nomeVacina,
        dataAplicacao: dataAplicacao ?? this.dataAplicacao,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vacina &&
          runtimeType == other.runtimeType &&
          nomeVacina == other.nomeVacina &&
          dataAplicacao == other.dataAplicacao;

  @override
  int get hashCode => nomeVacina.hashCode ^ dataAplicacao.hashCode;
}
