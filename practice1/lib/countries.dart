// ignore_for_file: unused_local_variable, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countrydetails.dart';

class Countries extends StatefulWidget {
  const Countries({super.key});

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  var data;
  Future<void> getCountriesApi() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v2/all'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Countries Data'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue.shade200,
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getCountriesApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          // scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Countrydetail(
                                            img: data[index]['flags']['png']
                                                .toString(),
                                            native: data[index]['nativeName']
                                                .toString(),
                                            popu: data[index]['population']
                                                .toString(),
                                            reg: data[index]['region']
                                                .toString(),
                                            subreg: data[index]['subregion']
                                                .toString(),
                                            cap: data[index]['capital']
                                                .toString(),
                                            numeric: data[index]['numericCode']
                                                .toString(),
                                            nam: data[index]['name'].toString(),
                                          )),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 350,
                                    width: 350,
                                    color: Colors.lightBlue.shade200,
                                    child: Column(
                                      children: [
                                        Image(
                                            height: 200,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(data[index]
                                                    ['flags']['png']
                                                .toString())),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Reuse(
                                            title: 'Population',
                                            val: data[index]['population']
                                                .toString()),
                                        Reuse(
                                            title: 'Region',
                                            val: data[index]['region']
                                                .toString()),
                                        Reuse(
                                            title: 'capital',
                                            val: data[index]['capital']
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Reuse extends StatelessWidget {
  String title;
  String val;

  Reuse({required this.title, required this.val, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            val,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
