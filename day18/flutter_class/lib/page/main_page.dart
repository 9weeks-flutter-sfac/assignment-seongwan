import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var instance = FirebaseFirestore.instance;
  List items = [];
  // read
  readFromCloudFireStore() async {
    var res = await instance.collection('memo').get();  // firebase의 해당 collection에 있는 문서들을 가져온다.
    // var data = res.docs.first;
    // print(data.data());
    setState(() {
      items = res.docs.map((e) => e.data()).toList(); 
    });
  }

  getDocument(String documentId) async {
    var instance = FirebaseFirestore.instance;
    var res = await instance.collection('memo').doc(documentId).get();  // .doc(문서명)을 넣으면 하나만 가져온다.
    print(res.data());
  }

  readFinishedDocument() async {
    var res =await instance.collection('memo').where('isFinished', isEqualTo: true).get();  // 해당 컬렉션에 필터.
    print(res.docs);
    print(res.size);
  }

  createDocument(String title) async {
    // create  // DocId 자동(unique auto_generated)
    var res = await instance.collection('memo').add({'title': title, 'isFinished': false});
  }

  createDocumentById(String docId, String title) async {
    // create // 지정 DocId(set) 방식: 예. userId를 documentId로 쓴다.
    var res = await instance
    .collection('memo')
    .doc(docId)
    .set({
      'title': title,
      'isFinished': false,
    });
    // 이미 존재하는 Id라면 SetOption(merge: true)를 이용해 새로운 값으로 덮어씌울 수 있다.
  }

  updateDocument(String docId, Map<String, dynamic> data) {
    // update
    instance.collection('memo').doc(docId).update(data);  // update는 Future<void>라 반환값이 없다. await, async가 필요 없다.
  }

  deleteDocument(String docId) {
    // delete
    instance.collection('memo').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: readFromCloudFireStore, 
              child: const Text("가져오기")
            ),
            TextButton(
              onPressed: () {
                getDocument('jyv6Y8k3hvvUj9MZct6E');
                getDocument('cFaHkdN8bgft1gRrRFl6');
              }, 
              child: const Text("하나만 가져오기")
            ),
            TextButton(
              onPressed: () {
                readFinishedDocument();
              }, 
              child: const Text("finished만 가져오기")
            ),
            TextButton(
              onPressed: () {
                createDocument('책방 가서 책 읽기');
              }, 
              child: const Text("문서 추가")
            ),
            TextButton(
              onPressed: () {
                createDocumentById('123456789', '노래방 가서 노래 부르기');
              }, 
              child: const Text("문서 추가(지정아이디)")
            ),
            TextButton(
              onPressed: () {
                updateDocument('123456789', {'isFinished': true});
              }, 
              child: const Text("문서 수정")
            ),
            TextButton(
              onPressed: () {
                deleteDocument('123456789');
              }, 
              child: const Text("문서 삭제")
            ),
            if(items.isNotEmpty)
              ...items.map((e) => Text(e['title'])).toList()  // spread 문법.
          ],
        ),        
      ),
    );
  }
}