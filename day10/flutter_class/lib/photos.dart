// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _imagePicker = ImagePicker();
  // var image1 = null;
  // var image2 = null;
  // var image3 = null;
  // var image4 = null;
  List<XFile?> images = [null, null, null, null];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          title: Text("포토네컷"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: images.length,
              itemBuilder: (context, index) => InkWell(
                onDoubleTap: () => setState(() => images[index] = null),
                onTap: () async {
                  var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (xfile != null){
                    images[index] = xfile;
                    setState(() {
                      
                    });
                  }
                },
                child: Container(
                  height: 160,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    image: images[index] != null ? DecorationImage(
                      image: FileImage(File(images[index]!.path)),
                      fit: BoxFit.cover) : null,
                  color: Colors.white12,
                  ),
                ),
              )),
            // child: Column(
            //   children: images
            //     .asMap()  // asMap().entries를 이용해 key와 value로 표현할 수 있다.
            //     .entries
            //     .map((e)=>Expanded(  // Expanded는 Column 안에서만 사용한다.
            //       child: InkWell(
            //         onDoubleTap: () => setState(() => images[e.key] = null),
            //         onTap: () async {
            //           var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //           if (xfile != null){
            //             images[e.key] = xfile;
            //             setState(() {
                          
            //             });
            //           }
            //         },
            //         child: Container(
            //           margin: EdgeInsets.symmetric(vertical: 4),
            //           decoration: BoxDecoration(
            //             image: images[e.key] != null ? DecorationImage(
            //               image: FileImage(File(images[e.key]!.path)),
            //               fit: BoxFit.cover) : null,
            //           color: Colors.white12,
            //           ),
            //         ),
            //       ),
            //     ))
            //     .toList(),
            //   // children: [
            //   //   Expanded(
            //   //     child: InkWell(
            //   //       onDoubleTap: () => setState(() => image2 = null),
            //   //       onTap: () async {
            //   //         var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //   //         if (xfile != null){
            //   //           image2 = xfile;
            //   //           setState(() {
                          
            //   //           });
            //   //         }
            //   //       },
            //   //       child: Container(
            //   //         margin: EdgeInsets.symmetric(vertical: 4),
            //   //         decoration: BoxDecoration(
            //   //           image: image2 != null ? DecorationImage(
            //   //             image: FileImage(File(image2.path)),
            //   //             fit: BoxFit.cover) : null,
            //   //         color: Colors.white12,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   Expanded(
            //   //     child: InkWell(
            //   //       onDoubleTap: () => setState(() => image1 = null),
            //   //       onTap: () async {
            //   //         var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //   //         if (xfile != null){
            //   //           image1 = xfile;
            //   //           setState(() {
                          
            //   //           });
            //   //         }
            //   //       },
            //   //       child: Container(
            //   //         margin: EdgeInsets.symmetric(vertical: 4),
            //   //         decoration: BoxDecoration(
            //   //           image: image1 != null ? DecorationImage(
            //   //             image: FileImage(File(image1.path)),
            //   //             fit: BoxFit.cover) : null,
            //   //         color: Colors.white12,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   Expanded(
            //   //     child: InkWell(
            //   //       onDoubleTap: () => setState(() => image2 = null),
            //   //       onTap: () async {
            //   //         var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //   //         if (xfile != null){
            //   //           image2 = xfile;
            //   //           setState(() {
                          
            //   //           });
            //   //         }
            //   //       },
            //   //       child: Container(
            //   //         margin: EdgeInsets.symmetric(vertical: 4),
            //   //         decoration: BoxDecoration(
            //   //           image: image2 != null ? DecorationImage(
            //   //             image: FileImage(File(image2.path)),
            //   //             fit: BoxFit.cover) : null,
            //   //         color: Colors.white12,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   Expanded(
            //   //     child: InkWell(
            //   //       onDoubleTap: () => setState(() => image3 = null),
            //   //       onTap: () async {
            //   //         var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //   //         if (xfile != null){
            //   //           image3 = xfile;
            //   //           setState(() {
                          
            //   //           });
            //   //         }
            //   //       },
            //   //       child: Container(
            //   //         margin: EdgeInsets.symmetric(vertical: 4),
            //   //         decoration: BoxDecoration(
            //   //           image: image3 != null ? DecorationImage(
            //   //             image: FileImage(File(image3.path)),
            //   //             fit: BoxFit.cover) : null,
            //   //         color: Colors.white12,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   Expanded(
            //   //     child: InkWell(
            //   //       onDoubleTap: () => setState(() => image4 = null),
            //   //       onTap: () async {
            //   //         var xfile = await _imagePicker.pickImage(source: ImageSource.gallery);
            //   //         if (xfile != null){
            //   //           image4 = xfile;
            //   //           setState(() {
                          
            //   //           });
            //   //         }
            //   //       },
            //   //       child: Container(
            //   //         margin: EdgeInsets.symmetric(vertical: 4),
            //   //         decoration: BoxDecoration(
            //   //           image: image4 != null ? DecorationImage(
            //   //             image: FileImage(File(image4.path)),
            //   //             fit: BoxFit.cover) : null,
            //   //         color: Colors.white12,
            //   //         ),
            //   //       ),
            //   //     ),
            //   //   ),
            //   // ],
            // ),
          ),
        ),
      ),
    );
  }
}