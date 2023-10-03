// int calculate() {
//   return 6 * 7;
// }
import 'package:http/http.dart' as http;

void main() async {  // await을 썼기에 async를 넣는다.
  print('http 테스트');
  var url = 'https://sniperfactory.com/sfac/http_test';
  var response = await http.get(Uri.parse(url));
  // print(response.statusCode);  // .body로 했을 때에는 html코드가 출력된다.
  print(response.body);
}