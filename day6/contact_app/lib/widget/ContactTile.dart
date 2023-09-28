// ignore_for_file: prefer_const_constructors

import 'package:contact_app/page/contact_detail_page.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.imgUrl, required this.name, required this.phone});
  final String imgUrl;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ContactDetailPage(
              name: name,
              phone: phone,
              image: imgUrl,
            ),
          )
        );
      },
      title: Text(name), 
      subtitle: Text(phone),
      trailing: Icon(Icons.call),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(imgUrl),  
      ),
    );
  }
}