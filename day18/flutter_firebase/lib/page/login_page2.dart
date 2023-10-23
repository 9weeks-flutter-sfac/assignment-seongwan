import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SFAC",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: -2
              ),
            ),
            const SizedBox(height: 8,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Text("아이디를 입력해주세요."),
            ),
            const SizedBox(height: 8,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Text("비밀번호를 입력해주세요."),
            ),
            const SizedBox(height: 8,),
            ElevatedButton(
              onPressed: _handleLogin, 
              child: const Text("로그인하기"),
            ),
            TextButton(
              onPressed: _handleSignup, 
              child: const Text('회원가입하기'),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(children: const [
              Expanded(
                child: Divider(
                  indent: 16,
                  endIndent: 16,))
            ],),
            const SizedBox(height: 24,),
            FilledButton.icon(
              icon: const Icon(Icons.g_mobiledata),
              onPressed: _handleGoogleLogin, 
              label: const Text("구글 로그인"))
          ],
        ),
      ),
    );
  }

  _handleLogin() => FirebaseAuth.instance.signInWithEmailAndPassword(
    email: 'test@gmail.com', password: 'test12341234');
  
  _handleSignup() => FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: 'test@gmail.com', password: 'test12341234');

  _handleGoogleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}