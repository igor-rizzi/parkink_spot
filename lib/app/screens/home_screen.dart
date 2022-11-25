import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

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
  void _incrementCounter() {
    setState(() {

      _counter  ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(widget.title),
        ),
        body:
        Obx(() =>
        controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            :
        Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.listParkingSpotObs.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  Column(
                    children: [
                      Text(controller.listParkingSpotObs[index].responsibleName),
                      Text(controller.listParkingSpotObs[index].modelCar),

                      ElevatedButton(onPressed: () async {

                        //MAP generico sem tipar
                        // Map<String, dynamic> parkingSpot = {
                        //   "parkingSpotNumber": "11",
                        //   "licensePlateCar": "asdasd",
                        //   "brandCar": "tesla",
                        //   "modelCar": "model s",
                        //   "colorCar": "branco",
                        //   "registrationDate": "",
                        //   "responsibleName": "Vagner",
                        //   "apartment": "401",
                        //   "block": "A",
                        // };


                        ParkingSpotModel parkingSpot = ParkingSpotModel(
                             "",
                            "11",
                            "asdasd",
                            "tesla",
                            "model s",
                            "branco",
                            "",
                            "Vagner",
                            "401",
                            "A");

                      var response =  await controller.post(parkingSpot);
                        if(response != false){

                          Get.snackbar(
                            "Sucesso",
                            "Salvo com Sucesso",
                            icon: Icon(Icons.check, color: Colors.white),
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.lightGreen,
                            colorText: Colors.white,

                          );

                        }else{
                          Get.snackbar(
                              "Houve um erro",
                              "Deu ruim",
                              icon: Icon(Icons.error, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blue,
                              //   borderColor: Colors.blue
                              colorText: Colors.white
                          );
                        }



                      }, child: Text("Envia POST SAVE"))



                    ],
                  );

              }),
        )
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}