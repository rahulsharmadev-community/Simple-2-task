import 'package:flutter/foundation.dart';

abstract class HelpSupport_DB {
  static List<HSlistItem> lists = [
    HSlistItem(
        image: 'assets/svg/whatsapp.svg',
        title: 'Whatsapp Chat Right Now!',
        subtitle:
            'Our messaging assistant can quickly solve many issues or direct you to the right person.',
        onTap: () {}),
    HSlistItem(
        image: 'assets/svg/mail.svg',
        title: 'Write us an email',
        subtitle:
            'We don\'t believe in auto-responses, therefore our assistant will look into your issue'
            ' and get back to you within 24 hours. Please describe the problem in detail for quick support.',
        onTap: () {}),
    HSlistItem(
        image: 'assets/svg/ceo.svg',
        title: 'Contact to CEO',
        subtitle: 'Do you want to bring your issue to the attention of the CEO?'
            'Using this service will take you directly to CEO. In most cases, it takes 3 to 7 working days.',
        onTap: () {}),
  ];
}

class HSlistItem {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const HSlistItem(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.onTap});
}
