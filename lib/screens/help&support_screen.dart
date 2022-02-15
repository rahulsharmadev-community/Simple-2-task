import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaytest/logic/helpClass.dart';
import '../logic/help&support_database.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  Card cardTile(
          {required String title,
          required String leading,
          required String subtitle,
          required VoidCallback onTap}) =>
      Card(
          child: ListTile(
              onTap: onTap,
              title: Text(title),
              leading: SizedBox.square(
                  dimension: 56, child: SvgPicture.asset(leading)),
              subtitle: Text(subtitle)));

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    text: 'Hi Jayraj,\n',
                    style: textTheme.titleLarge,
                    children: [
                  TextSpan(
                    text:
                        'We apologies if you are need to visit this page due to any issue.',
                    style: textTheme.bodyMedium,
                  )
                ])),
            SizedBox.square(
              dimension: MediaQuery.of(context).size.width / 2,
              child: SvgPicture.asset(
                'assets/svg/help.svg',
              ),
            ),
            Text(
                'You are our valuable customer and we are ensuring that your issue is resolved as soon as possible.',
                style: textTheme.caption,
                textAlign: TextAlign.center),
            Expanded(
              child: ListView(
                  shrinkWrap: true,
                  children: HelpSupport_DB.lists
                      .map((e) => cardTile(
                          title: e.title,
                          leading: e.image,
                          subtitle: e.subtitle,
                          onTap: () {
                            // For Demo It just show a SnackBar
                            HelpClass.showSnackBar(context, e.title);
                          }))
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }
}
