import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaytest/logic/ImagePicker.dart';
import 'package:jaytest/logic/helpClass.dart';

class VerifyAccount_Screen extends StatefulWidget {
  const VerifyAccount_Screen({Key? key}) : super(key: key);

  @override
  State<VerifyAccount_Screen> createState() => _VerifyAccount_ScreenState();
}

class _VerifyAccount_ScreenState extends State<VerifyAccount_Screen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _regNoController = TextEditingController();
  TextEditingController _contectController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String? selectedimage;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      HelpClass.showSnackBar(context, 'Please Enter correct Input.');
      return;
    }
    HelpClass.showSnackBar(
        context,
        selectedimage != null
            ? 'Save successful.'
            : 'You forget to Attach a Id.');

    // _globalKey.currentState!.save();
  }

  Widget textField(
          {required String labelText,
          String hintText = '',
          TextInputType keyboardType = TextInputType.text,
          TextEditingController? editingController,
          int? maxLength,
          int maxLines = 1,
          String? prefixText,
          String? Function(String?)? validator}) =>
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(labelText),
        ),
        subtitle: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: editingController,
          onChanged: (_) => setState(() {}),
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          validator: (value) {
            if (value!.length < 3) {
              return 'Oops.. to shot.';
            } else {
              return validator != null ? validator(value) : null;
            }
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: hintText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              prefixText: prefixText),
        ),
      );

  pikerbutton(ImageSource source) => OutlinedButton.icon(
      onPressed: () async {
        try {
          selectedimage = await ImagePickerFun.getImagefromDevice(source);
          if (selectedimage == null)
            HelpClass.showSnackBar(
                context, 'Please attach file it\'s necessary.');
        } catch (e) {
          HelpClass.showSnackBar(
              context, 'Oops. Something wrong try agine later');
        }
        setState(() {});
      },
      icon: const Icon(Icons.camera_alt_rounded),
      label: Text(source.name));

  @override
  void dispose() {
    // TODO: implement dispose
    _contectController.dispose();
    _emailController.dispose();
    _regNoController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify your account'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: const EdgeInsets.all(8), children: [
          ListTile(
            leading: SvgPicture.asset('assets/svg/advisor.svg'),
            title: const Text('Mr.Market Verficiation',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: const Text('Financial advisor'),
          ),
          const Text(
              'A verified badge is a check that appears next to a Mr. Market account’s'
              ' name to indicate that the account is Registered Investment Advisor (RIA)'
              ' is a person or an organization who gives investment advice to individuals.'),
          const SizedBox(height: 16),
          textField(
            labelText: 'Name / Trade Name',
            hintText: 'eg. Sachin Kumar',
            editingController: _nameController,
          ),
          textField(
            labelText: 'Registration No.',
            hintText: 'eg. 987655551236000',
            editingController: _regNoController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.length != 15) {
                return 'Oops least 15 digits.';
              } else if (value.contains(RegExp(r'^[0-9]+$'))) {
                return null;
              } else {
                return 'Please enter valid Registration No.';
              }
            },
          ),
          textField(
            labelText: 'Contact Person/No.',
            hintText: 'eg. 987456321',
            editingController: _contectController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.length != 10)
                return 'Oops least 10 digits.';
              else if (value.contains(RegExp(r'^[0-9]+$'))) {
                return null;
              } else {
                return 'Please enter valid Registration No.';
              }
            },
          ),
          textField(
            labelText: 'Email',
            hintText: 'eg. test@gmail.com',
            editingController: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              return value!.contains('@gmail.com')
                  ? null
                  : 'Please enter valid email id';
            },
          ),
          ListTile(
            leading:
                selectedimage != null ? Image.file(File(selectedimage!)) : null,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Attach a photo of your ID'),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                          context: context,
                          builder: (_ctx) => ListTile(
                                subtitle: const Text(
                                  'Pick out most appropriate for you.',
                                  textAlign: TextAlign.center,
                                ),
                                title: Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: [
                                    pikerbutton(ImageSource.camera),
                                    pikerbutton(ImageSource.gallery)
                                  ],
                                ),
                              ));
                    },
                    child: const Text('Choose file'))
              ],
            ),
            subtitle: const Text(
                'We require a government issued photo ID that shows your name and date of birth,'
                ' which must match with Contact person of registered ID.'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(onPressed: _submit, child: const Text('Submit'))
        ]),
      ),
    );
  }
}
