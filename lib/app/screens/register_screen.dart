import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var controller = ParkingSpotController.parkingSpotController;

  void initState() {
    super.initState();
    controller.listParkingSpot();
    // controller.listCurrecies();
  }

  final _formKey = GlobalKey<FormState>();

  final _parkingSpotNumberController = TextEditingController();
  final _licensePlateCarController = TextEditingController();
  final _brandCarController = TextEditingController();
  final _modelCarController = TextEditingController();
  final _colorCarController = TextEditingController();
  final _responsibleNameController = TextEditingController();
  final _apartamentController = TextEditingController();
  final _blockController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Menu(context),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _parkingSpotNumberController,
              decoration: const InputDecoration(
                hintText: 'Enter your parking spot number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _licensePlateCarController,
              decoration: const InputDecoration(
                hintText: 'Enter your license plate car',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _brandCarController,
              decoration: const InputDecoration(
                hintText: 'Enter your brand car',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _modelCarController,
              decoration: const InputDecoration(
                hintText: 'Enter your model car',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _colorCarController,
              decoration: const InputDecoration(
                hintText: 'Enter your color car',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _responsibleNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your responsible name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _apartamentController,
              decoration: const InputDecoration(
                hintText: 'Enter your apartament',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _blockController,
              decoration: const InputDecoration(
                hintText: 'Enter your block',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  ParkingSpotModel parkingSpot = ParkingSpotModel(
                      "",
                      _parkingSpotNumberController.text,
                      _licensePlateCarController.text,
                      _brandCarController.text,
                      _modelCarController.text,
                      _colorCarController.text,
                      "",
                      _responsibleNameController.text,
                      _apartamentController.text,
                      _blockController.text
                  );

                  var response = await controller.post(parkingSpot);
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

                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),

    );
  }
}