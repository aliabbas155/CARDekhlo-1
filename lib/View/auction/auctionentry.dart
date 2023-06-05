import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Components/constants.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final nameController = TextEditingController();
  final registeredController = TextEditingController();
  final distanceController = TextEditingController();
  final modelController = TextEditingController();
  final addressController = TextEditingController();

  late DocumentReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseFirestore.instance.collection('Auction').doc();
  }

  Widget _dataField(TextEditingController controller, String label, String hint,
      TextInputType type,
      {int? lines}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      textAlign: TextAlign.center,
      maxLines: lines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter $hint...';
        }
        return null;
      },
      decoration: kTextFieldDecoration.copyWith(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        hintText: hint,
        labelText: label,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Auction verification')),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Its Time To Get Secure By Getting Verified',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _dataField(nameController, 'Name', 'Enter Your Name',
                      TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  _dataField(registeredController, 'Car Registered City',
                      'Enter Your Car Registered City', TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  _dataField(distanceController, 'Distance Covered',
                      'Enter Car Distance Covered', TextInputType.number),
                  const SizedBox(
                    height: 30,
                  ),
                  _dataField(modelController, 'Car Model',
                      'Enter Your Car Model', TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  _dataField(addressController, 'Address',
                      'Enter Your Address', TextInputType.text),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Map<String, String> Auction = {
                        'id': dbRef.id,
                        'name': nameController.text,
                        'registered city': registeredController.text,
                        'distance': distanceController.text,
                        'model': modelController.text,
                        'address': addressController.text,
                      };

                      dbRef.set(Auction).onError((error, stackTrace) =>
                          Fluttertoast.showToast(msg: 'Somthing went wrong'));

                      Fluttertoast.showToast(msg: 'Uploaded Successfully');
                      Get.back();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.red)),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
