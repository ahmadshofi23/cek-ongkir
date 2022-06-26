// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rajaongkir/app/data/models/provinsi_models.dart';

import 'package:rajaongkir/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:http/http.dart' as http;

// void main() async {
//   var url = Uri.parse("https://api.rajaongkir.com/starter/province");
//   var response =
//       await http.get(url, headers: {"key": "8993d65330dda201b54a3560bcc08fd6"});

//   var data = jsonDecode(response.body)["rajaongkir"]["results"];

//   print(data);
//   // return data!.map((e) => Provinsi.fromJson(e)).toList();

//   // print(data);
// }
