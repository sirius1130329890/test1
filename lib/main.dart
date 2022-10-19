import 'package:flutter/material.dart';

void main() {runApp( MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<int> _items = List.generate(0, (i) => i);

  @override
  Widget build(BuildContext context) {
    double value = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width/4*(_items.length/2).round());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: value < MediaQuery.of(context).size.width/2 ? MediaQuery.of(context).size.width/2 : value*0.96,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
            ),
            wrap(context, _items)
          ],
        )
      ),
    );
  }
}

Wrap wrap(BuildContext context, List<int> items){
  return Wrap(
    direction: Axis.horizontal,
    children: items.map((i) => SizedBox(
      width: MediaQuery.of(context).size.width/2,
      height: MediaQuery.of(context).size.width/4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3,)
          ),
          child: Center(child: Text(
              'Item ${i+1}',
            style: const TextStyle(fontSize: 25),
          ),),
        ),
      ),
    )
    ).toList(),
  );
}