import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  final TextEditingController _controllerNum1 = TextEditingController();
  final TextEditingController _controllerNum2 = TextEditingController();

  String option = " ";
  double sum = 0.0;
  double sub = 0.0;
  double mul = 0.0;
  double div = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Column(
        children: <Widget>[
          // ENTRADAS DE DADOS
          TextField(
            controller: _controllerNum1,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Digite um número",
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),

          TextField(
            controller: _controllerNum2,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: "Digite um número",
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),

          // RADIO BUTTONS
          RadioListTile(
            title: const Text("Soma"),
            value: "soma",
            groupValue: option,
            onChanged: (String? value) {
              setState(() {
                option = value!;
                sum = double.parse(_controllerNum1.text) +
                    double.parse(_controllerNum2.text);
                print(sum);
              });
            },
          ),
          RadioListTile(
            title: const Text("Subtração"),
            value: "subtracao",
            groupValue: option,
            onChanged: (String? value) {
              setState(() {
                option = value!;
                sub = double.parse(_controllerNum1.text) -
                    double.parse(_controllerNum2.text);
                print(sub);
              });
            },
          ),
          RadioListTile(
            title: const Text("Multiplicação"),
            value: "multiplicacao",
            groupValue: option,
            onChanged: (String? value) {
              setState(() {
                option = value!;
                mul = double.parse(_controllerNum1.text) *
                    double.parse(_controllerNum2.text);
                print(mul);
              });
            },
          ),
          RadioListTile(
            title: const Text("Divisão"),
            value: "divisao",
            groupValue: option,
            onChanged: (String? value) {
              setState(() {
                option = value!;
                div = double.parse(_controllerNum1.text) /
                    double.parse(_controllerNum2.text);
                print(div);
              });
            },
          ),

          //OUTPUT
          
        ],
      ),
    );
  }
}
