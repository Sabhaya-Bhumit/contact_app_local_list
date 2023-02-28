import 'package:demo/screens/add_contact.dart';
import 'package:demo/screens/detail_page.dart';
import 'package:demo/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomePage(),
      'add_contact': (context) => const AddContact(),
      'detail_page': (context) => DetailPage(data1: null),
    },
  ));
}
