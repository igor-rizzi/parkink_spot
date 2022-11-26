import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:parking_spot/app/screens/details_screen.dart';
import 'package:parking_spot/app/screens/update_screen.dart';

import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
    // controller.listCurrecies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: Menu(context),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.listParkingSpotObs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.directions_car),
                              title: Text(controller
                                  .listParkingSpotObs[index].parkingSpotNumber),
                              subtitle: Text(controller
                                  .listParkingSpotObs[index].licensePlateCar),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Get.to(UpdatePage(object: controller.listParkingSpotObs[index]));
                                    },
                                    color: Colors.blue),
                                const SizedBox(width: 8),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      controller.delete(controller
                                          .listParkingSpotObs[index].id);
                                    },
                                    color: Colors.red),
                                const SizedBox(width: 8),
                                IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                     Get.to(DetailsPage(object: controller.listParkingSpotObs[index]));
                                    },
                                    color: Colors.green),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
