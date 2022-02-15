import 'package:flutter/material.dart';
import 'package:jaytest/logic/help&support_database.dart';
import 'package:jaytest/screens/help&support_screen.dart';
import 'package:jaytest/screens/varifyaccount_screen.dart';

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
        home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Both Task Available',
            style: TextStyle(color: Colors.blue),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Task 1', textAlign: TextAlign.center),
              subtitle: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_ctx) => const HelpSupportScreen(),
                )),
                child: const Text('Help & Support'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Task 2', textAlign: TextAlign.center),
              subtitle: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_ctx) => const VerifyAccount_Screen(),
                )),
                child: const Text('Verify Your Account'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
