
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.age, this.height, this.isMale, this.result);

  final int age;
  final double height;
  final bool isMale;
  final double result;


  String get healthTxt{
    String res='';
    if(result>=30) res='Obese';
    else if(result>25 && result<30) res='OverWeight';
    else if(result >=18.5 && result<=24.9) res='Normal';
    else res='Thin';

    return res;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCard('Age : $age'),
              buildCard('Gender : ${isMale? 'Male':'Female'}'),
              buildCard('Healthiness : $healthTxt'),
              buildCard('Result : ${result.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(String txt) {
    return Card(
                elevation: 20,
                color: Colors.grey.shade300,
                child: Text(txt,style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              );
  }
}
