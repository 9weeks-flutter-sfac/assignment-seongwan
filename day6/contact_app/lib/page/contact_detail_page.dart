// ignore_for_file: prefer_const_constructors

import 'package:contact_app/widget/ContactTile.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key, required this.name, required this.phone, required this.image});
  final String name;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
            image,
            width: double.infinity,
            height: 240,
            fit: BoxFit.cover,
          ),
          ContactTile(imgUrl: image, name: name, phone: phone)
        ],
      ),
    );
  }
}