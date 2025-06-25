import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  int i = 0;
  int e = 0;

  int dClick = 14;

  List<String> diasSemana = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<Map> dias = List.generate(
    30,
    (index) => {'dia': index + 1, 'click': false},
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              width: width,
              height: height * .88,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: width,
                          height: height * .3,
                          child: Image.asset(
                            'assets/images/museum.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Opacity(
                          opacity: .8,
                          child: Container(
                            width: width,
                            height: height * .3,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                colors: [
                                  const Color.fromARGB(83, 0, 0, 0),
                                  Colors.black,
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width,
                          height: height * .3,
                          child: Center(
                            child: Text(
                              'Official\nTicketing Service',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1. Date to visit',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.amber,
                                ),
                              ),

                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                  ),
                                  Container(width: 5),
                                  Text(
                                    'September',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (var d in diasSemana)
                                    Text(
                                      d,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.amber,
                                      ),
                                    ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  for (var d in dias)
                                    GestureDetector(
                                      onTap: () {
                                        if (d['dia'] >= 14 &&
                                            d['dia'] != 17 &&
                                            d['dia'] != 24) {
                                          dClick = d['dia'];
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: width * .12,
                                        height: width * .12,
                                        decoration: BoxDecoration(
                                          border: dClick == d['dia']
                                              ? Border.all(
                                                  width: 1,
                                                  color: Colors.amber,
                                                )
                                              : null,
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            d['dia'].toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color:
                                                  (d['dia'] < 14 ||
                                                      d['dia'] == 17 ||
                                                      d['dia'] == 24)
                                                  ? Colors.grey
                                                  : d['dia'] == dClick
                                                  ? Colors.amber
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          Container(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '2. Number of Tickets',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                          Container(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'General Admission:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '€22',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (i > 0) {
                                        i--;
                                      }

                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(width: 5),
                                  Text(
                                    i.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(width: 5),
                                  IconButton(
                                    onPressed: () {
                                      if (i < 9) {
                                        i++;
                                      }

                                      setState(() {});
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Under 18s, Under 26s\nresidents of theEEA, Museum\nmembers, Professionals',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'FREE',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (e > 0) {
                                        e--;
                                      }

                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(width: 5),
                                  Text(
                                    e.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(width: 5),
                                  IconButton(
                                    onPressed: () {
                                      if (e < 9) {
                                        e++;
                                      }

                                      setState(() {});
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * .12,
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total: €44',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * .4, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(999),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () => (),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 20, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
