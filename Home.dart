import 'package:cmn3_calculadora/Home1.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();

  double _adicao = 0;
  double _divisao = 0;
  double _multiplicacao = 0;
  double _subtracao = 0;
  String _textoResultado = "";

  void _calcularTabuada() {
    var _numero1 = double.tryParse(_controllerNumero1.text);
    var _numero2 = double.tryParse(_controllerNumero2.text);

    if (_numero1 == null || _numero2 == null) {
      setState(() {
        _textoResultado = "Os números não podem ser nullos.";
      });
    } else {
      _adicao = _numero1 + _numero2;
      _divisao = _numero1 / _numero2;
      _multiplicacao = _numero1 * _numero2;
      _subtracao = _numero1 - _numero2;
      setState(() {
        _textoResultado = "Adição: " +
            _adicao.toString() +
            "\n Divisão: " +
            _divisao.toString() +
            "\n Multiplicação: " +
            _multiplicacao.toString() +
            "\n Subtração: " +
            _subtracao.toString();
      });
    }
  }

  void _limparCampo() {
    _controllerNumero1.clear();
    _controllerNumero2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Calculadora Básica ®"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Operações Básicas da Tabuada",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Digite o primeiro número:"),
                style: TextStyle(fontSize: 20, color: Colors.black),
                controller: _controllerNumero1,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Digite o segundo número:"),
                style: TextStyle(fontSize: 20, color: Colors.black),
                controller: _controllerNumero2,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                padding: EdgeInsets.all(15),
                onPressed: () {
                  _calcularTabuada();
                },
                child: Text("Calcular", style: TextStyle(fontSize: 15)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                _textoResultado,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  padding: EdgeInsets.all(15),
                  child: Text("Segunda Tela", style: TextStyle(fontSize: 15)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Home1(valor: _textoResultado)));
                  },
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                    padding: EdgeInsets.all(15),
                    child: Text("Limpar Tela", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      setState(() {
                        _limparCampo();
                      });
                    }))
          ],
        )));
  }
}
