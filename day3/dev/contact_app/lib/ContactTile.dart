// ignore_for_file: file_names, implementation_imports, unused_import, unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.name, required this.phone, required this.imgUrl});
  final String name;
  final String phone;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
              title: Text(name),
              subtitle: Text(
                phone,
                style: TextStyle(color: Colors.green),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(imgUrl),
              ),
              trailing: Icon(Icons.call),
    );
  }
}