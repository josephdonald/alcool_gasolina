import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina =
      TextEditingController();

  double _resultado;
  String _resposta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
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
                  "Saiba qual a melhor opção para abastecimento do seu carro",
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
                controller: _textEditingControllerAlcool,
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
                controller: _textEditingControllerGasolina,
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
                  onPressed: () {
                    print("Valor do alcool: " +
                        _textEditingControllerAlcool.text);
                    print("Valor da gasolina: " +
                        _textEditingControllerGasolina.text);

                    double valorAlcool = double.parse(_textEditingControllerAlcool.text);
                    double valorGasolina = double.parse(_textEditingControllerGasolina.text);

                    double valor  = valorAlcool / valorGasolina;

                    _resultado = num.parse(valor.toStringAsPrecision(2));

                    if (_resultado <= 0.7){
                      _resposta = "Alcool";
                    } else if (_resultado > 0.7){
                      _resposta = "Gasolina";
                    }

                    setState(() {
                      _resultado.toString();
                      _resposta;
                    });

                  },
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
