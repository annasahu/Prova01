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
  // CONTROLLERS PARA MANIPULAR O TEXTO
  final TextEditingController _controllerNum1 = TextEditingController();
  final TextEditingController _controllerNum2 = TextEditingController();

  // VARIAVEIS
  String _option = " ";
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: const Text("Calculadora"),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.calculate_outlined, color: Colors.white)),
      ),
      
      body: Container(
        //ALINHAMENTO DOS WIDGETS
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        
        child: Column(
          children: <Widget>[
            
            SizedBox(height: 15),

            // ENTRADAS DE DADOS
            TextField(
              controller: _controllerNum1,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: "Digite um número",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}'))
              ],
            ),

            SizedBox(height: 15),

            TextField(
              controller: _controllerNum2,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: "Digite um número",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,10}'))
              ],
            ),

            SizedBox(height: 15),

            Divider(thickness: 5, color: Colors.pink[50]),

            SizedBox(height: 15),

            // RADIO BUTTONS
            RadioListTile(
              title: const Text("Soma"),
              activeColor: Colors.pink[600],
              value: "soma",
              groupValue: _option,
              onChanged: (String? value) {
                setState(() {
                  _option = value!;
                  result = double.parse(_controllerNum1.text) +
                      double.parse(_controllerNum2.text);
                  print(result);
                });
              },
            ),

            RadioListTile(
              title: const Text("Subtração"),
              activeColor: Colors.pink[600],
              value: "subtracao",
              groupValue: _option,
              onChanged: (String? value) {
                setState(() {
                  _option = value!;
                  result = double.parse(_controllerNum1.text) -
                      double.parse(_controllerNum2.text);
                  print(result);
                });
              },
            ),

            RadioListTile(
              title: const Text("Multiplicação"),
              activeColor: Colors.pink[600],
              value: "multiplicacao",
              groupValue: _option,
              onChanged: (String? value) {
                setState(() {
                  _option = value!;
                  result = double.parse(_controllerNum1.text) *
                      double.parse(_controllerNum2.text);
                  print(result);
                });
              },
            ),

            RadioListTile(
              title: const Text("Divisão"),
              activeColor: Colors.pink[600],
              value: "divisao",
              groupValue: _option,
              onChanged: (String? value) {
                setState(() {
                  _option = value!;
                  result = double.parse(_controllerNum1.text) /
                      double.parse(_controllerNum2.text);
                  print("$result");
                });
              },
            ),

            SizedBox(height: 15),

            Divider(thickness: 5, color: Colors.pink[50]),

            SizedBox(height: 15),

            //OUTPUT
            Container(
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Resultado',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('$result',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),

            SizedBox(height: 20),

            //BOTÃO PARA LIMPAR CAMPOS
            ElevatedButton.icon(
              onPressed: () {
                _controllerNum1.clear();
                _controllerNum2.clear();
              },
              icon: Icon(Icons.refresh, color: Colors.white),
              label: Text('Limpar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
