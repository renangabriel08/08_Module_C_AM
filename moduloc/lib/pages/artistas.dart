import 'package:flutter/material.dart';

class Artistas extends StatefulWidget {
  const Artistas({super.key});

  @override
  State<Artistas> createState() => _ArtistasState();
}

class _ArtistasState extends State<Artistas> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore the art of',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        Text(
                          'Renaissance',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 167, 125, 0),
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Container(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Type to search...',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.fullscreen),
                      ),
                    ),
                    DefaultTabController(
                      length: 2,
                      child: SizedBox(
                        height: 50,
                        child: TabBar(
                          dividerHeight: 3,
                          dividerColor: const Color.fromARGB(
                            255,
                            143,
                            143,
                            143,
                          ),
                          indicatorColor: const Color.fromARGB(
                            255,
                            167,
                            125,
                            0,
                          ),
                          labelColor: const Color.fromARGB(255, 167, 125, 0),
                          tabs: [
                            Tab(text: 'Artists'),
                            Tab(text: 'Artworks'),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Leonardo da Vinci'),
                      subtitle: Text('1452 - 1519'),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Image.asset(
                          'assets/images/leonardo_da_vinci/0.jpeg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 1; i < 4; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, '/exposicao'),
                                child: SizedBox(
                                  width: width * .35,
                                  height: height * .2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.only(
                                      topLeft: Radius.circular(
                                        i == 1
                                            ? 999
                                            : i == 2
                                            ? 0
                                            : 0,
                                      ),
                                      topRight: Radius.circular(
                                        i == 1
                                            ? 999
                                            : i == 2
                                            ? 0
                                            : 0,
                                      ),
                                      bottomLeft: Radius.circular(
                                        i == 1
                                            ? 999
                                            : i == 2
                                            ? 999
                                            : 0,
                                      ),
                                      bottomRight: Radius.circular(
                                        i == 1
                                            ? 999
                                            : i == 2
                                            ? 999
                                            : 0,
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/images/leonardo_da_vinci/$i.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(height: 20),

                    ListTile(
                      title: Text('Michelangelo', textAlign: TextAlign.end),
                      subtitle: Text('1475 - 1564', textAlign: TextAlign.end),
                      trailing: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Image.asset(
                          'assets/images/michelangelo/0.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 1; i < 4; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width * .35,
                                height: height * .2,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(
                                      i == 1
                                          ? 0
                                          : i == 2
                                          ? 999
                                          : 999,
                                    ),
                                    topRight: Radius.circular(
                                      i == 1
                                          ? 0
                                          : i == 2
                                          ? 999
                                          : 999,
                                    ),
                                    bottomLeft: Radius.circular(
                                      i == 1
                                          ? 999
                                          : i == 2
                                          ? 999
                                          : 0,
                                    ),
                                    bottomRight: Radius.circular(
                                      i == 1
                                          ? 999
                                          : i == 2
                                          ? 999
                                          : 0,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/michelangelo/$i.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(height: 20),

                    ListTile(
                      title: Text('Gustav Klimt'),
                      subtitle: Text('1862 - 1918'),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: Image.asset(
                          'assets/images/gustav_klimt/0.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 1; i < 4; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width * .35,
                                height: height * .2,
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.only(
                                    topLeft: Radius.circular(
                                      i == 1
                                          ? 999
                                          : i == 2
                                          ? 0
                                          : 999,
                                    ),
                                    topRight: Radius.circular(
                                      i == 1
                                          ? 999
                                          : i == 2
                                          ? 0
                                          : 999,
                                    ),
                                    bottomLeft: Radius.circular(
                                      i == 1
                                          ? 000
                                          : i == 2
                                          ? 0
                                          : 999,
                                    ),
                                    bottomRight: Radius.circular(
                                      i == 1
                                          ? 0
                                          : i == 2
                                          ? 0
                                          : 999,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/images/gustav_klimt/$i.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
