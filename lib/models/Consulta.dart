class Consulta {
  double? precoGasolina;
  double? precoEtanol;
  DateTime? horarioConsulta;
  String? combustMelhorEscolha;
  double? resultado;

  Consulta(double precoGasolina, double precoEtanol,
      {DateTime? horario, String? melhorEscolha, double? resultado}) {
    this.precoGasolina = precoGasolina;
    this.precoEtanol = precoEtanol;
    this.horarioConsulta = horario;
    this.combustMelhorEscolha = melhorEscolha;
    this.resultado = resultado;
  }

  void comparaCombustivel(precoGasolina, precoEtanol) {
    this.resultado = precoEtanol / precoGasolina;
  }
}
