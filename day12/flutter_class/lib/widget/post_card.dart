// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/model/post.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrlString(post.postUrl);  // 해당 Url의 페이지로 이동한다.
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.symbolImg),
              ),
              const SizedBox(height: 8,),
              Text(
                post.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 24,),
              Text(DateFormat.MMMEd().format(post.createdAt)),
              const SizedBox(height: 8,),
              ClipRRect(  // 모서리 둥글게
                borderRadius: BorderRadius.circular(16),
                child: Image.network(post.thumbnailImag)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.upload),
                      Text(post.upCount?.toString() ?? '')  // null이면 빈 칸으로.
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.comment),
                      Text(post.comments.length.toString())
                    ],
                  ),
                  Icon(Icons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}