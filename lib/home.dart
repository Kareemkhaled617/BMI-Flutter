import 'dart:math';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 120.0;
  int age = 20;
  double weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_outlined),
        title: Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: 185,
                            height: 180,
                            decoration: BoxDecoration(
                              color: isMale ? Colors.teal : Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 70,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Male',
                                  style: Theme.of(context).textTheme.headline1,
                                )
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 17,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: 170,
                          height: 180,
                          decoration: BoxDecoration(
                            color: !isMale ? Colors.teal : Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.female,
                                size: 70,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Female',
                                style: Theme.of(context).textTheme.headline1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(
                            '${heightVal.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                      Slider(
                          max: 220,
                          min: 60,
                          value: heightVal,
                          onChanged: (newValue) {
                            setState(() {
                              heightVal = newValue;
                            });
                          })
                    ],
                  ),
                )),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildExpanded(context, 'Age'),
                    SizedBox(
                      width: 10,
                    ),
                    buildExpanded(context, 'Weight'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heightVal / 100, 2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Result(age, 22.5, isMale, result);
                      }));
                    },
                    child: Text('Calculator'),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildExpanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Text(
              type == 'Age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 12,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
