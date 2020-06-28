import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  MoneyMaskedTextController _valorControllerAlcool = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: ',',
    precision: 2,
  );

  MoneyMaskedTextController _valorControllerGasolina = MoneyMaskedTextController(
    thousandSeparator: '.',
    decimalSeparator: ',',
    precision: 2,
  );

  double _resultado = 0.0;
  String _resposta = "...";

  void _calcularCombustivel() {
    double valorAlcool = double.tryParse(_valorControllerAlcool.text.replaceAll(",", "."));
    double valorGasolina = double.tryParse(_valorControllerGasolina.text.replaceAll(",", "."));

    double valor = valorAlcool / valorGasolina;

    _resultado = num.tryParse(valor.toStringAsPrecision(2));

    if (_resultado <= 0.7) {
      _resposta = "Álcool";
    } else if (_resultado > 0.7) {
      _resposta = "Gasolina";
    }

    setState(() {
      _resposta;
      _resultado;

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //IMAGEM
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  "images/logo.png",
                ),
              ),
              //TEXTO
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Saiba qual a melhor opção de combustível",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              //PRECO ALCOOL
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
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.blueAccent,
                  onPressed: _calcularCombustivel,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Escolha: " + _resposta,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Resultado: " + _resultado.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
