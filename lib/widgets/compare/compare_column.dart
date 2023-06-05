import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Model/car_model.dart';
import '../../services/utility.dart';

class CompareColumn extends StatefulWidget {
  const CompareColumn({Key? key, required this.data}) : super(key: key);
  final List<CarModel> data;
  @override
  State<CompareColumn> createState() => _CompareColumnState();
}

class _CompareColumnState extends State<CompareColumn> {
  // var foundCarLeft = <CarModel>[].obs;
  List<CarModel> foundList = [];
  CarModel? selectedCar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (value) {
            var results = Utility.runFilter(value, widget.data);
            setState(() {
              foundList = results;
            });
          },
          decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Search',
              suffixIcon: Icon(Icons.search)),
        ),
        const SizedBox(
          height: 20,
        ),
        foundList.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: foundList.length,
                  primary: true,
                  itemBuilder: (context, index) => Card(
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      isThreeLine: true,
                      leading: Text(
                        foundList[index].company.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      title: Text(foundList[index].model.toUpperCase()),
                      subtitle: Text(foundList[index].engine.toUpperCase()),
                      onTap: () {
                        setState(() {
                          selectedCar = foundList[index];
                          foundList = [];
                        });
                      },
                    ),
                  ),
                ),
              )
            : selectedCar != null

                //car design details here
                ? Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              height: 0.3.sh,
                              width: 0.4.sw,
                              child: Carousel(
                                images: List.generate(
                                  selectedCar?.images.length ?? 0,
                                  (index) =>
                                      Image.network(selectedCar?.images[index]),
                                ),
                                showIndicator: true,
                                borderRadius: true,
                                radius: const Radius.circular(16),
                                boxFit: BoxFit.cover,
                                moveIndicatorFromBottom: 180.0,
                                dotSize: 0.01.sw,
                                dotSpacing: 0.04.sw,
                                noRadiusForIndicator: false,
                                overlayShadow: false,
                                overlayShadowColors: Colors.white54,
                                overlayShadowSize: 0.3,
                              )),
                          Text("Car Name:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text(
                              "${selectedCar?.company.toUpperCase()} ${selectedCar?.model.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontSize: 15,color: Colors.yellow,)),
                          Text("Car Engine:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("${selectedCar?.engine.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15,color: Colors.yellow,)),
                          Text("Average:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("${selectedCar?.average.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15,color: Colors.yellow,)),
                          Text("No of seats:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("${selectedCar?.seats.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15,color: Colors.yellow,)),
                          Text("Car Body:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("${selectedCar?.body.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15,color: Colors.yellow,)),
                          Text("Car Suspension:",
                              style:
                                  Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
                          Text("${selectedCar?.suspension.toUpperCase()}",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15,color: Colors.yellow,)),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: widget.data.length,
                      primary: true,
                      itemBuilder: (context, index) => Card(
                        color: Colors.white.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          isThreeLine: true,
                          leading: Text(
                            widget.data[index].company.toUpperCase(),
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          title: Text(widget.data[index].model.toUpperCase(),style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                          subtitle:
                              Text(widget.data[index].engine.toUpperCase(),textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),),
                          onTap: () {
                            setState(() {
                              selectedCar = widget.data[index];
                            });
                          },
                        ),
                      ),
                    ),
                  ),
      ],
    );
  }
}
