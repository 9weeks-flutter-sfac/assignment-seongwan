// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:contact_app/widget/ContactTile.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
          scrollDirection: Axis.vertical,
          children: [
            ContactTile(imgUrl: 'https://picsum.photos/100/100', name: '이테디', phone: '010-1010-2020'),
            ContactTile(imgUrl: 'https://picsum.photos/150/150', name: '크리스', phone: '010-1010-2020'),
            ContactTile(imgUrl: 'https://picsum.photos/50/50', name: '주노', phone: '010-1010-2020'),
          ],
    );
  }
}