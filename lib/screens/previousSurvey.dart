import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_monkey/constants.dart';
import 'package:survey_monkey/screens/selectDiscipline.dart';
import 'package:survey_monkey/widgets/appbars.dart';
import 'package:survey_monkey/widgets/spacers.dart';

class PreviousSurvey extends StatefulWidget {
  const PreviousSurvey({super.key});

  @override
  State<PreviousSurvey> createState() => _PreviousSurveyState();
}

class _PreviousSurveyState extends State<PreviousSurvey> {
  var selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Previous Surveys",
              style: TextStyle(fontSize: 20, color: ck.x),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        gap20(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: Get.width,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Select Dates for Survey"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'Start Date : ${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}'),
                                            ElevatedButton(
                                              onPressed: () {
                                                _selectDate(context);
                                              },
                                              child: const Text('Select'),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'End Date : ${selectedDate.year.toString()}-${selectedDate.month.toString()}-${selectedDate.day.toString()}'),
                                            ElevatedButton(
                                              onPressed: () {
                                                _selectDate(context);
                                              },
                                              child: const Text('Select'),
                                            ),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.to(const SelectDiscipline());
                                          },
                                          child: const Text("Next"),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            // Navigator.pop(context);

                            // Get.to(const SelectDiscipline());
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Survey ${index + 1}"),
                                index % 3 == 0
                                    ? const Text(
                                        "Inactive",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : Text(
                                        "Active",
                                        style: TextStyle(
                                          color: ck.x,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
