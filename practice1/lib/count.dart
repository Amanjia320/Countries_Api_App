// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/countprovider.dart';

class CountScreen extends StatefulWidget {
  CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Provider'),
          centerTitle: true,
        ),
        body: Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        })),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade400,
          foregroundColor: Colors.black,
          onPressed: () {
            counter.setCount();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
