import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  double height = 170;
  double weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass index"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m1Expanded(context, "male"),
                  const SizedBox(width: 15),
                  m1Expanded(context, "female"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m2Expanded(context, "weight"),
                  const SizedBox(width: 15),
                  m2Expanded(context, "age"),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  // functions
  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == "male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == "male") || (!isMale && type == "female")
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == "male" ? Icons.male : Icons.female),
              const SizedBox(height: 15),
              Text(type == "male" ? "Male" : "Female",
                  style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == "age" ? "Age" : "Weight",
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 15),
            Text(type == "age" ? "$age" : "$weight",
                style: Theme.of(context).textTheme.headline1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: type=="age"?"Age":"Weight",
                  onPressed: () {
                    setState(() {
                      type=="age"? age--:weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: type=="age"?"Age":"Weight",
                  onPressed: () {
                    setState(() {
                      type=="age"? age++:weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
