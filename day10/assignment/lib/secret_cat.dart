import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              // future: SecretCatApi.fetchSecrets(),
              future: SecretCatApi.fetchAuthors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // return Text(snapshot.data!.first.secret);  // snapshot.data가 null일 수도 있으니 확신하도록 !을 붙여준다.
                  // return snapshot.data!.first.avatar != null
                  // ? CircleAvatar(
                  //   backgroundImage: 
                  //   NetworkImage(snapshot.data!.first.avatar!),
                  // )
                  // : SizedBox();
                  return ListTile(
                    leading: snapshot.data!.first.avatar != null
                      ? CircleAvatar(backgroundImage: NetworkImage(snapshot.data!.first.avatar!),)
                      : CircleAvatar(child: Text(snapshot.data!.first.username[0]),),
                    title: Text(snapshot.data!.first.username),
                    subtitle: Text(snapshot.data!.first.id),
                  );
                }
                return LinearProgressIndicator();  // builder에는 return이 항상 있어야 한다.
              }
            ),
          ],
        ),
      )
    );
  }
}