import 'package:flutter/material.dart';

class ArticleTile extends StatefulWidget {
  const ArticleTile({super.key, required this.title, required this.author, required this.content});
  final String title;
  final String author;
  final String content;

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  bool isExpanded = false;  // 상태를 가질 때는 override 위에 적는다.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),  // stateless와 다르게 stateful에서는 widget.을 붙여줘야 한다.
          subtitle: Text(widget.author),
          onTap: () {
            isExpanded = !isExpanded;  // 앞에 붙는 !은 true일 때 false로 상태를 바꿔준다. 그리고 그 반대도 마찬가지이다.
            setState(() {
              
            });
          },
        ),
        if(isExpanded) Text(widget.content)
      ],
    );
  }
}