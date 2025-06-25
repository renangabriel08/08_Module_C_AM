import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation tamanho;
  Animation? pos;

  String desc =
      'We are thrilled to invite you to join us for an extraordinary event that will immerse you in the world of art.';
  String titulo = 'Experience Art';

  List caracsDesc = [];
  List caracsTitulo = [];

  animarFundo() async {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    tamanho = Tween<double>(
      begin: 520,
      end: 100,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.addListener(() => setState(() {}));
    await controller.forward();
    await Future.delayed(const Duration(seconds: 3));
    await animarTitulo();
    await animarTexto();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    pos = Tween<double>(
      begin: 300,
      end: 0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    controller.addListener(() => setState(() {}));
    await controller.forward();
  }

  animarTexto() async {
    List caracs = desc.split('');

    for (var c in caracs) {
      caracsDesc.add(c);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  animarTitulo() async {
    List caracs = titulo.split('');

    for (var c in caracs) {
      caracsTitulo.add(c);
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  @override
  void initState() {
    animarFundo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', height: 100),
              SizedBox(
                width: width,
                height: height * .6,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * .6,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.amber),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(999),
                          topRight: Radius.circular(999),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(999),
                          topRight: Radius.circular(999),
                        ),
                        child: Image.asset('assets/images/louvre.jpg'),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 3),
                        width: width,
                        height: tamanho.value,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 50,
                              spreadRadius: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, -100),
                child: Column(
                  children: [
                    Text(
                      caracsTitulo.join(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    Container(height: 8),
                    Text(
                      caracsDesc.join(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Container(height: 16),
                    Transform.translate(
                      offset: Offset(0, pos?.value ?? 300),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * .5, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(999),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/explore'),
                        child: Text(
                          'Explore Now',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
