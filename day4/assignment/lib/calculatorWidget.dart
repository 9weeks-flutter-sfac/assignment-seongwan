// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
      int X = 0;
      int Y = 0;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('X의 값은?'),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {
                      X = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'x값을 입력하세요',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Y의 값은?'),
                ),
                Container(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {
                      Y = int.parse(value);
                    } ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'y값을 입력하세요',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String result = (X + Y).toString();
              showResultDialog(context, result);
            }, 
            child: Text('더하기의 결과값은')
          ),
          ElevatedButton(
            onPressed: () {
              String result = (X * Y).toString();
              showResultDialog(context, result);
            }, 
            child: Text('곱하기의 결과값은')
          ),
          ElevatedButton(
            onPressed: () {
              String result = (X - Y).toString();
              showResultDialog(context, result);
            }, 
            child: Text('빼기의 결과값은')
          ),
          ElevatedButton(
            onPressed: () {
              String result = (X / Y).toString();
              showResultDialog(context, result);          
            }, 
            child: Text('나누기의 결과값은')
          ),
        ],
      ),
    );
  }
}
void showResultDialog(BuildContext context, var result) {
  showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
            child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
              child: Text("$result", 
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ),
          ),
      );
    },
  );
}