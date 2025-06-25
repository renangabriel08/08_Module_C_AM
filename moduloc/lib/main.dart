import 'package:flutter/material.dart';
import 'package:moduloc/pages/artistas.dart';
import 'package:moduloc/pages/explore.dart';
import 'package:moduloc/pages/exposicao.dart';
import 'package:moduloc/pages/home.dart';
import 'package:moduloc/pages/tickets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        fontFamily: 'PlayfairDisplay',
      ),
      routes: {
        '/home': (context) => const Home(),
        '/explore': (context) => const Explore(),
        '/tickets': (context) => const Tickets(),
        '/artistas': (context) => const Artistas(),
        '/exposicao': (context) => const Exposicao(),
        '/teste': (context) => TabBarDemo(),
      },
      initialRoute: '/home',
    );
  }
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 100,
                child: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              // Container(
              //   height: 200,
              //   child: TabBarView(
              //     children: [
              //       Icon(Icons.directions_car),
              //       Icon(Icons.directions_transit),
              //       Icon(Icons.directions_bike),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
