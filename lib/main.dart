
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var inputPeso = TextEditingController();
  var inputAltura = TextEditingController();

  String textResult = "";
  String textImc = "";

  void calculate(){
    setState(() {     
       
      double peso = double.parse(inputPeso.text);
      double altura = double.parse(inputAltura.text) / 100;
      double imc = peso / (altura * altura);
      print(imc);

      if (imc < 18.6) {
        textResult = "Abaixo do peso";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      } else if (imc >= 18.6 && imc < 24.9){
        textResult = "Peso Ideal";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      } else if (imc >= 24.9 && imc < 29.9){
        textResult = "Sobrepeso";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      } else if (imc >= 29.9 && imc < 34.9){
        textResult = "Obesidade moderada";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      } else if (imc >= 34.9 && imc < 39.9){
        textResult = "Obesidade Severa";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      } else if (imc > 39.9){
        textResult = "Obesidade mórbida";
        textImc = "IMC: ${imc.toStringAsPrecision(3)}".replaceAll('.', ',');
      }

     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.deepPurpleAccent),
          ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: inputPeso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  hintText: 'Peso em KG',
                  hintStyle: TextStyle(color: Colors.orange),
                  labelText: 'Peso',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                style: TextStyle(color: Colors.orange),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: inputAltura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  hintText: 'Altura em centímetros',
                  hintStyle: TextStyle(color: Colors.orange),
                  labelText: 'Altura',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                style: TextStyle(color: Colors.orange),
              ),
            ),
           Container(
             padding: EdgeInsets.only(bottom: 10.0),
             height: 50.0,
             child:  RaisedButton(
              onPressed: calculate,
              child: Text(
                "CALCULAR",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              color: Colors.orange,
              ),
            ),
            Text(
              textResult,
              style: TextStyle(color: Colors.orange, fontSize: 25.0),
            ),
            Text(
              textImc,
              style: TextStyle(color: Colors.orange, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
