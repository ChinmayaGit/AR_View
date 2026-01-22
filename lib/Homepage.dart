import 'package:ar_posters/ModelViewer.dart';
import 'package:ar_posters/QrScanner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> model = [
    "earth",
    "planet_earth",
    "earth_wars_optimus_maximus",
    "solar_system_animation",

    "hummingbird__flying",
    "phoenix_bird",
    "snow_dragon",
    "star_sparrow_modular_spaceship",
    "T_Rex",
    "suchominus_-_lowpoly",
    "trotting_cat",
    "koi_fish",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Model"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(QRScan());
        },
        child: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemCount: 10, // Total number of items in the grid
          itemBuilder: (BuildContext context, int index) {
            // You can replace this with the widget you want to display in each grid item
            return GestureDetector(
              onTap: () {
                Get.to(ModelView(name: "${model[index]}.glb"));
              },
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Colors.black),
                child: Center(
                  // child: Text('Item ${model[index]}'),
                  child: Image.asset("assets/${model[index]}.png",
                      fit: BoxFit.fitHeight),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
