import 'package:flutter/material.dart';
import 'package:revelation/common/phone_body_container/index.dart';
import 'package:revelation/common/phone_layout_container/index.dart';
import 'package:revelation/pages/home_page/devices/phone_home_page/directory_section/index.dart';

class PhoneHomePage extends StatefulWidget {
  const PhoneHomePage({Key? key}) : super(key: key);

  @override
  State<PhoneHomePage> createState() => _PhoneHomePageState();
}

class _PhoneHomePageState extends State<PhoneHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneBodyContainer(
        child: PhoneLayoutContainer(
          title: 'Folders',
          children: [
            DirectorySection(),
          ],
        ),
      ),
    );
  }
}
