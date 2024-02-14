// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Countrydetail extends StatefulWidget {
  String img;
  String native;
  String popu;
  String reg;
  String subreg;
  String cap;
  String numeric;
  String nam;

  Countrydetail(
      {required this.img,
      required this.native,
      required this.popu,
      required this.reg,
      required this.subreg,
      required this.cap,
      required this.numeric,
      required this.nam,
      Key? key})
      : super(key: key);

  @override
  State<Countrydetail> createState() => _CountrydetailState();
}

class _CountrydetailState extends State<Countrydetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade100,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 210, top: 70),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      //borderRadius: BorderRadius.circular(),
                      border: Border.all(width: 1, color: Colors.white)),
                  child: const Center(
                      child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.img))),
            ),
            Text(
              widget.nam,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Reusable(
                  title: 'Native Name',
                  value: widget.native,
                ),
                SizedBox(
                  height: 5,
                ),
                Reusable(
                  title: 'Population',
                  value: widget.popu,
                ),
                SizedBox(
                  height: 5,
                ),
                Reusable(
                  title: 'Region',
                  value: widget.reg,
                ),
                SizedBox(
                  height: 5,
                ),
                Reusable(
                  title: 'SubRegion',
                  value: widget.subreg,
                ),
                SizedBox(
                  height: 5,
                ),
                Reusable(
                  title: 'Capital',
                  value: widget.cap,
                ),
                SizedBox(
                  height: 5,
                ),
                Reusable(
                  title: 'NumericCode',
                  value: widget.numeric,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Reusable extends StatelessWidget {
  String title;
  String value;
  Reusable({required this.title, required this.value, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
