import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({Key? key}) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  String option = " ";
  var num1 = 0.0;
  var num2 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text("Soma"),
              value: "soma",
              groupValue: option,
              onChanged: (String? value) {
                setState(() {
                  option = value!;
                });
              },
            ),

            RadioListTile(
              title: Text("Subtração"),
              value: "subtracao",
              groupValue: option,
              onChanged: (String? value) {
                setState(() {
                  option = value!;
                });
              },
            ),

            RadioListTile(
              title: Text("Multiplicação"),
              value: "multiplicacao",
              groupValue: option,
              onChanged: (String? value) {
                setState(() {
                  option = value!;
                });
              },
            ),

            RadioListTile(
              title: Text("Divisão"),
              value: "divisao",
              groupValue: option,
              onChanged: (String? value) {
                setState(() {
                  option = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
