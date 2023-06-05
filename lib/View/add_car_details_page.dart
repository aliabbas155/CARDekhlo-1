import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Components/car_image_widget.dart';
import '../Components/constants.dart';
import '../config/firebase.dart';
import '../services/database.dart';



class AddCarDetailsPage extends StatefulWidget {
  const AddCarDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCarDetailsPage> createState() => _AddCarDetailsPageState();
}

class _AddCarDetailsPageState extends State<AddCarDetailsPage> {
  var adTitleController = TextEditingController();
  String? carCompany;
  var carDescriptionController = TextEditingController();
  var carLocationController = TextEditingController();
  var carMilageController = TextEditingController();
  var carModelController = TextEditingController();
  var carPriceController = TextEditingController();
  var carRegistrationController = TextEditingController();
  var carVariantController = TextEditingController();
  final companies = ['Toyota', 'Honda', 'Suzuki'];

  final _formKey = GlobalKey<FormState>();

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        alignment: Alignment.center,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Widget _fieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _dataField(
      TextEditingController controller, String hint, TextInputType type,
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
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFabVisible = !(MediaQuery.of(context).viewInsets.bottom != 0);
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Add Details',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarImageWidget(
                    onClicked: () async {
                      await storage.imageSourceForCar(context);
                      setState(() {});
                    },
                    imageUrls: storage.images!,
                  ),
                  _fieldTitle('Title'),
                  _dataField(adTitleController, 'Ad Title', TextInputType.text,
                      lines: 2),
                  _fieldTitle('City'),
                  _dataField(
                    carLocationController,
                    'Location',
                    TextInputType.name,
                  ),
                  _fieldTitle('Car Company'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        hint: const Center(child: Text('Select Company')),
                        value: carCompany,
                        isExpanded: true,
                        items: companies.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                          () {
                            carCompany = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  _fieldTitle('Car Model'),
                  _dataField(carModelController, 'Model', TextInputType.text),
                  _fieldTitle('Car Variant'),
                  _dataField(carVariantController, 'Variant/Version',
                      TextInputType.text),
                  _fieldTitle('Registered In'),
                  _dataField(carRegistrationController, 'Registration City',
                      TextInputType.name),
                  _fieldTitle('Milage (km)'),
                  _dataField(carMilageController, 'Milage in Kilometer (km)',
                      TextInputType.number),
                  _fieldTitle('Price'),
                  _dataField(carPriceController, 'Price', TextInputType.number),
                  _fieldTitle('Description'),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: _dataField(carDescriptionController,
                        'Write Something About The Car', TextInputType.text,
                        lines: 5),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: isFabVisible
          ? FloatingActionButton.extended(
              label: const Text(
                'Post AD',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var adTitle = adTitleController.text.trim();
                  var carLocation = carLocationController.text.trim();
                  var carCompany = this.carCompany;
                  var carModel = carModelController.text.trim();
                  var carVariant = carVariantController.text.trim();
                  var carRegistration = carRegistrationController.text.trim();
                  var carMilage = carMilageController.text.trim();
                  var carPrice = carPriceController.text.trim();
                  var carDescription = carDescriptionController.text.trim();

                  try {
                    List<String> picturesUrls = [];
                    for (int i = 0; i < storage.images!.length; i++) {
                      String? url = await storage.uploadFile(
                          storage.images![i], storage.imagesName![i]);
                      picturesUrls.add(url!);
                    }
                    uploadAdData(
                        picturesUrls,
                        adTitle,
                        carLocation,
                        carCompany!,
                        carModel,
                        carVariant,
                        carRegistration,
                        carMilage,
                        carPrice,
                        carDescription);

                    storage.images = [];
                    storage.imagesName = [];
                    Get.back();
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Something Went Wrong!');
                    Fluttertoast.showToast(msg: 'Must Select One Image!');
                  }
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
