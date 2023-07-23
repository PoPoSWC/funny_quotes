import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Funnyquote());
}

class Funnyquote extends StatelessWidget {
  const Funnyquote({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePang(),
    );
  }
}

class HomePang extends StatefulWidget {
  const HomePang({super.key});

  @override
  State<HomePang> createState() => _HomePangState();
}

class _HomePangState extends State<HomePang> {
  static const List<String> quoteList = [
    'วงนี้ใจมันชาแล้ว แต่ไม่รู้ว่าจะชาบู หรือชาไข่มุก',
    'ยอมรับว่าไม่ใช่คนดี เพราะทุกวันนี้เป็นคนบ้า',
    'หน้าไม่หวานส่วนปากไม่ต้องถาม หมาแน่นอน',
    'จงเลือกอยู่กับคนที่ใช่ ใช่เลยควรอยู่คนเดียว',
    'อยากลองขัดใจ แต่หาสกอตไบรท์ไม่เจอ',
    'ชีวิตมันสั้นนะ เพราะถ้ายาวจะเป็น "ชีวิตตตตตตต"',
  ];
  static const List colorsList = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.black,
    Colors.pink,
    Colors.orange,
    Colors.purple,
  ];
  var color = colorsList[0];

  var quote = quoteList[0]; // state variable
  var count = 0; //ลำดับคำเริ่ม
  var countColor = 0; //ลำดับสีเริ่ม
  void _handleClickGo() {
    setState(() {
      var rand = Random();
      var randomindex = rand.nextInt(quoteList.length);
      var randomCor = rand.nextInt(colorsList.length);
      while (randomindex == count) {
        randomindex = rand.nextInt(quoteList.length);
      } //สุ่มเลขใหม่หากซ้ำตำแหน่งคำก่อนหน้า
      while (randomCor == countColor) {
        randomCor = rand.nextInt(colorsList.length);
      } //สุ่มเลขใหม่หากซ้ำตำแหน่งสีก่อนหน้า
      countColor = randomCor;
      count = randomindex;
      quote = quoteList[randomindex];
      color = colorsList[randomCor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวน')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Text('GO'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          quote,
          style: TextStyle(
              color: color,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      )),
    );
  }
}

