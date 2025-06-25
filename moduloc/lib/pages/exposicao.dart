import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exposicao extends StatefulWidget {
  const Exposicao({super.key});

  @override
  State<Exposicao> createState() => _ExposicaoState();
}

class _ExposicaoState extends State<Exposicao> {
  List dados = [];
  int index = 0;

  startApp() async {
    String data = await rootBundle.loadString('assets/data/artworks.json');

    dados = jsonDecode(data);
    setState(() {});
  }

  @override
  void initState() {
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C),
      body: dados.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned(
                  bottom: height * .27,
                  left: width * .1,
                  child: Opacity(
                    opacity: .3,
                    child: Image.asset('assets/images/quote.png', height: 70),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: CarouselSlider(
                    items: [
                      for (int i = 1; i < dados.length + 1; i++)
                        if (i == 2)
                          Column(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: width * .75,
                                    height: height * .5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadiusGeometry.only(
                                        topLeft: Radius.circular(999),
                                        topRight: Radius.circular(999),
                                      ),
                                      child: Image.asset(
                                        'assets/images/leonardo_da_vinci/$i.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * .75,
                                    height: height * .1,
                                    color: Colors.amber,

                                    child: Center(
                                      child: ListTile(
                                        title: Text(dados[i - 1]['title']),
                                        subtitle: Text(
                                          '${dados[i - 1]['years']},${dados[i - 1]['born_at']}',
                                        ),
                                        trailing: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              999,
                                            ),
                                            color: Colors.black,
                                          ),
                                          child: Icon(
                                            Icons.arrow_outward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(40),
                                child: Text(
                                  dados[i - 1]['comment'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        else
                          Column(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: width * .75,
                                    height: height * .1,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadiusGeometry.only(
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),

                                    child: Center(
                                      child: ListTile(
                                        title: Text(dados[i - 1]['title']),
                                        subtitle: Text(
                                          '${dados[i - 1]['years']}, ${dados[i - 1]['born_at']}',
                                        ),
                                        trailing: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              999,
                                            ),
                                            color: Colors.black,
                                          ),
                                          child: Icon(
                                            Icons.arrow_outward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .75,
                                    height: height * .5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadiusGeometry.only(
                                        bottomLeft: Radius.circular(999),
                                        bottomRight: Radius.circular(999),
                                      ),
                                      child: Image.asset(
                                        'assets/images/leonardo_da_vinci/$i.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(40),
                                child: Text(
                                  dados[i - 1]['comment'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                    ],
                    options: CarouselOptions(
                      height: height * .9,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (i, reason) {
                        setState(() {
                          index = i;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
