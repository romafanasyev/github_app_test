import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                const authUrl =
                    'https://github.com/login/oauth/authorize?client_id=Iv1.5ce293f98b8506f3&redirect_uri=http://localhost:3000/callback';
                final result = await FlutterWebAuth2.authenticate(url: authUrl, callbackUrlScheme: 'callback');
                debugPrint('result: $result');

                final code = Uri.parse(result).queryParameters['code'];

                debugPrint('code: ${code!}');
              },
              child: const Text('Login with GitHub'),
            ),
            const SizedBox(height: 16),
            Text('Code: $_code'),
          ],
        ),
      ),
    );
  }
}
