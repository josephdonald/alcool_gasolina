import 'package:alcoolgasolina/models/Consulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Consulta consultaRealizada = Consulta(0, 0);

  TextEditingController _valorControllerAlcool = TextEditingController();
  TextEditingController _valorControllerGasolina = TextEditingController();

  double _resultado = 0.0;
  String _resposta = "...";

  List<Consulta> listaDeConsultas = [];

  void _calcularCombustivel() {
    double? valorAlcool =
        double.tryParse(_valorControllerAlcool.text.replaceAll(",", "."));
    double? valorGasolina =
        double.tryParse(_valorControllerGasolina.text.replaceAll(",", "."));

    consultaRealizada.comparaCombustivel(valorGasolina, valorAlcool);

    if (consultaRealizada.resultado! <= 0.7) {
      consultaRealizada.combustMelhorEscolha = "Álcool";
    } else if (consultaRealizada.resultado! > 0.7) {
      consultaRealizada.combustMelhorEscolha = "Gasolina";
    }

    setState(() {
      _resposta = consultaRealizada.combustMelhorEscolha!;
      _resultado = consultaRealizada.resultado!;

      _valorControllerAlcool.clear();
      _valorControllerGasolina.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  //IMAGEM
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "images/logo.png",
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Preço Álcool, ex: 1.86",
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _valorControllerAlcool,
                  ),
                  //PRECO GASOLINA
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 3.15",
                      labelStyle: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _valorControllerGasolina,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      // color: Colors.blueAccent,
                      onPressed: _calcularCombustivel,
                    ),
                  ),
                  Text(
                    "Escolha: " + _resposta,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Resultado: " + _resultado.toStringAsFixed(2),
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Últimas consultas:",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text("Consulta"),
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
