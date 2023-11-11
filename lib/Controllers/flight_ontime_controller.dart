import 'package:flight_checker/Utils/app_style.dart';
import 'package:flight_checker/Utils/constants.dart';
import 'package:flight_checker/services/api_request.dart';
import 'package:get/get.dart';

import '../Models/flight_details_model.dart';

class FlightOnTimeController extends GetxController {
  static FlightOnTimeController to = Get.find();

  RxList<FlightDetail> flight = <FlightDetail>[].obs;

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    isLoading.value = true;
    ApiRequest(url: Constant.baseUrl, frmData: {
      "recordLocator": "D83PWG",
      "lastName": "ALAM"
    }).post(
        beforeSend: () {},
        onSuccess: (onSuccess) async {
          // flight = await FlightDetails

          var res =
              await FlightDetails.fromJson(onSuccess as Map<String, dynamic>);
          flight.clear();
          flight.addAll(res.data as Iterable<FlightDetail>);
          isLoading.value = false;
          update();
          print(res);
          print(flight[0].flightType);
        },
        onError: (onError) {
          Get.snackbar(
            "Error",
            "Please try again!",
            snackPosition: SnackPosition.BOTTOM,
            colorText: AppStyle.textWhite,
            backgroundColor: AppStyle.accentColor,
            duration: Duration(seconds: 2),
          );
        });
  }
}
