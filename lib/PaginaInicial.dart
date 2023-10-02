import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double precoAlcool = double.parse(_controllerAlcool.text);
    double precoGasolina = double.parse(_controllerGasolina.text);

    if ((precoAlcool / precoGasolina) >= 0.7) {
      setState(() {
        _resultado = "melhor abastecer com gasolina:";
      });
    } else {
      setState(() {
        _resultado = "melhor abastecer com alcool";
      });
    }
    _limparCampos();
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  var _resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
      ),
      body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('images/logo.png'),
              Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Preço Alcool, ex: 2.09'),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: 'Preço gasolina, ex: 5.09'),
                controller: _controllerGasolina,
              ),
              ElevatedButton(
                onPressed: _calcular,
                child: Container(
                  child: Text('calcular'),
                ),
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50))),
              ),
              Text(
                "$_resultado",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
    );
  }
}
