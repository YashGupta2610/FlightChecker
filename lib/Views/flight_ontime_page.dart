import 'package:flight_checker/Controllers/flight_ontime_controller.dart';
import 'package:flight_checker/Utils/app_style.dart';
import 'package:flight_checker/Utils/loadig_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightOnTimePage extends StatelessWidget {
  const FlightOnTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<FlightOnTimeController>(builder: (ctrl) {
          return LoadingOverlay(
            isLoading: ctrl.isLoading.value,
            child: SingleChildScrollView(
              child: (ctrl.flight.isEmpty
                  ? dummy()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(30),
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/bg.jpg"),
                                colorFilter: ColorFilter.mode(
                                    Color(0xff2323f3), BlendMode.darken)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              flightDestination(
                                  ctrl.flight[0].legs![0].originCity.toString(),
                                  ctrl.flight[0].legs![0].origin.toString(),
                                  DateFormat("hh:mm")
                                      .format(ctrl.flight[0].legs![0]
                                          .estimatedDeparture!)
                                      .toString()),
                              Image.asset("assets/Line 2.png"),
                              Image.asset("assets/plane.png"),
                              flightDestination(
                                  ctrl.flight[0].legs![0].destinationCity
                                      .toString(),
                                  ctrl.flight[0].legs![0].destination
                                      .toString(),
                                  DateFormat("hh:mm")
                                      .format(ctrl
                                          .flight[0].legs![0].estimatedArrival!)
                                      .toString()),
                            ],
                          ),
                        ),

                        //Flight heads up widget
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 30),
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 8, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppStyle.accentColor,
                            ),
                            child: Text(
                              "Yay! Your flight is on time",
                              style: AppStyle.bodyPoppins(AppStyle.textBlack),
                            ),
                          ),
                        ),

                        //Passenger Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                          child: Text(
                            "Origin Station Name",
                            style: AppStyle.subHeading(AppStyle.textBlack),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                          child: Text(
                            ctrl.flight[0].legs![0].originStationName
                                .toString(),
                            style: AppStyle.heading(AppStyle.textBlack),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Flight detail row 1
                        Row(
                          children: [
                            headingBodyCard(
                                "Dep Terminal",
                                ctrl.flight[0].legs![0].departureTerminal
                                    .toString()),
                            headingBodyCard(
                                "Gate",
                                ctrl.flight[0].legs![0].destinationStationName
                                    .toString()),
                            headingBodyCard(
                                "Arr Terminal",
                                ctrl.flight[0].legs![0].arrivalTerminal
                                    .toString()),
                          ],
                        ),
                        //Flight detail row 2
                        Row(
                          children: [
                            headingBodyCard(
                                "Date",
                                DateFormat("dd/MM/y")
                                    .format(ctrl
                                        .flight[0].legs![0].estimatedDeparture!)
                                    .toString()),
                            headingBodyCard("Flight Status",
                                ctrl.flight[0].legs![0].flightState.toString()),
                            headingBodyCard(
                                "Flight",
                                ctrl.flight[0].legs![0].flightIdentifier
                                    .toString()),
                          ],
                        ),
                        //EndLine border
                        Padding(padding: EdgeInsets.all(16)),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              children: List.generate(
                                  150 ~/ 10,
                                  (index) => Expanded(
                                        child: Container(
                                          color: index % 2 == 0
                                              ? Colors.transparent
                                              : Colors.black,
                                          height: 2,
                                        ),
                                      )),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  height: 50,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: AppStyle.blue,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(100),
                                        bottomRight: Radius.circular(100),
                                      ))),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  height: 50,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: AppStyle.blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100),
                                      ))),
                            ),
                          ],
                        ),
                      ],
                    )),
            ),
          );
        }),
      ),
    );
  }

  Widget flightDestination(String name, String airport, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: AppStyle.subHeading(AppStyle.textWhite),
        ),
        Text(
          airport,
          style: AppStyle.heading(AppStyle.textWhite),
        ),
        Text(
          time,
          style: AppStyle.body(AppStyle.textWhite),
        ),
      ],
    );
  }

  Widget headingBodyCard(String heading, String body) {
    return Container(
      width: Get.width / 3,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: AppStyle.subHeading(AppStyle.textBlack),
          ),
          Text(
            body,
            style: AppStyle.body(AppStyle.textBlack),
          ),
        ],
      ),
    );
  }

//Dummy Static Page if the API Does not fetch data
  Widget dummy() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(30),
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/bg.jpg"),
                colorFilter:
                    ColorFilter.mode(Color(0xff2323f3), BlendMode.darken)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              flightDestination("Nagpur", 'NAG', "10:00"),
              Image.asset("assets/Line 2.png"),
              Image.asset("assets/plane.png"),
              flightDestination("Ahmedabad", "AMD", "13:30"),
            ],
          ),
        ),

        //Flight heads up widget
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding:
                EdgeInsets.symmetric(horizontal: Get.width / 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppStyle.accentColor,
            ),
            child: Text(
              "Yay! Your flight is on time",
              style: AppStyle.bodyPoppins(AppStyle.textBlack),
            ),
          ),
        ),

        //Passenger Name
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Text(
            "Passenger Name",
            style: AppStyle.subHeading(AppStyle.textBlack),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
          child: Text(
            "Shinku Rajendra Kumar",
            style: AppStyle.heading(AppStyle.textBlack),
          ),
        ),
        SizedBox(
          height: 20,
        ),

        //Flight detail row 1
        Row(
          children: [
            headingBodyCard("Dep Terminal", "4"),
            headingBodyCard("Gate", "C3"),
            headingBodyCard("Arr Terminal", "1A"),
          ],
        ),
        //Flight detail row 2
        Row(
          children: [
            headingBodyCard("Date", " 23/11/23"),
            headingBodyCard("Flight Status", "Arrived"),
            headingBodyCard("Flight", "6E1487"),
          ],
        ),
        //EndLine border
        Padding(padding: EdgeInsets.all(16)),
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: List.generate(
                  150 ~/ 10,
                  (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0
                              ? Colors.transparent
                              : Colors.black,
                          height: 2,
                        ),
                      )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 50,
                  width: 25,
                  decoration: BoxDecoration(
                      color: AppStyle.blue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ))),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 50,
                  width: 25,
                  decoration: BoxDecoration(
                      color: AppStyle.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                      ))),
            ),
          ],
        ),
      ],
    );
  }
}
