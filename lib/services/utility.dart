import 'package:car_dekh_lo/config/constants.dart';

import '../Components/constants.dart';
import '../Model/car_model.dart';

class Utility {
  static runFilter(String enteredKeyword, List<CarModel> data) {
    log.d(data);
    List<CarModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = [];
    } else {
      results = data
          .where(
            (element) =>
                element.model.toLowerCase().contains(enteredKeyword.trim()),
          )
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }
    log.d(results);
    // Refresh the UI
    return results;
  }
}
