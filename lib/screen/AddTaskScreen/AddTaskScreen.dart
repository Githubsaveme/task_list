import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_list/screen/scearchScreen/SearchScreen.dart';
import 'package:task_list/utils/CommonThings/commonThings.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController listController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  ///bool priority.
  bool isSelectedHigh = false;
  bool isSelectedMedium = false;
  bool isSelectedLow = false;
  bool isSelectedWhen = false;

  ///bool when
  bool isSelectedToday = false;
  bool isSelectedLater = false;

  ///global value
  String prioritySelected = '';
  String whenSelected = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: ElevatedButton(
            onPressed: () {
              if (formGlobalKey.currentState!.validate()) {
                listController.text;
                prioritySelected;
                whenSelected;
                Navigator.pop(context,
                    [listController.text, prioritySelected, whenSelected]);
              } else {
                debugPrint('write something');
              }
              setState(() {});
            },
            child: const Text('Add')),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              /*  actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                    finalSearchList: addList,
                                  )));
                    },
                    icon: const Icon(Icons.search))
              ],*/
              title: const Text("To Do"),
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                    "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&"
                    "ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&"
                    "fit=crop&w=500&q=60",
                    fit: BoxFit.cover),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Form(
                key: formGlobalKey,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: size.width * 0.1, bottom: size.width * 0.05),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: listController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '*required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              //add prefix icon
                              prefixIcon: const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: Colors.grey,
                              hintText: "Task Name",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: 'Task Name',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontFamily: "verdana_regular",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          priority,
                          style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                isSelectedHigh = true;
                                isSelectedMedium = false;
                                isSelectedLow = false;
                                prioritySelected = high;
                                debugPrint('high$prioritySelected');
                                setState(() {});
                              },
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: size.width * 0.055,
                                        child: VerticalDivider(
                                          color: isSelectedHigh
                                              ? Colors.red
                                              : Colors.red.shade200,
                                          width: 1,
                                          thickness: 3,
                                          indent: 1,
                                          endIndent: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        high,
                                        style: TextStyle(
                                            color: isSelectedHigh
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: size.width * 0.05),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                isSelectedMedium = true;
                                isSelectedHigh = false;
                                isSelectedLow = false;
                                prioritySelected = medium;
                                debugPrint(prioritySelected);
                                setState(() {});
                              },
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: size.width * 0.055,
                                        child: VerticalDivider(
                                          color: isSelectedMedium
                                              ? Colors.yellow
                                              : Colors.yellow.shade200,
                                          width: 1,
                                          thickness: 3,
                                          indent: 1,
                                          endIndent: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        medium,
                                        style: TextStyle(
                                            color: isSelectedMedium
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: size.width * 0.05),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                debugPrint('low');
                                isSelectedLow = true;
                                isSelectedHigh = false;
                                isSelectedMedium = false;
                                prioritySelected = low;
                                debugPrint(prioritySelected);

                                setState(() {});
                              },
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: size.width * 0.055,
                                        child: VerticalDivider(
                                          color: isSelectedLow
                                              ? Colors.green
                                              : Colors.green.shade200,
                                          width: 1,
                                          thickness: 3,
                                          indent: 1,
                                          endIndent: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        low,
                                        style: TextStyle(
                                            color: isSelectedLow
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: size.width * 0.05),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.width * 0.1),
                          child: Text(
                            when,
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                isSelectedToday = true;
                                isSelectedLater = false;
                                whenSelected = today;
                                debugPrint('today');
                                setState(() {});
                              },
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.grey,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      today,
                                      style: TextStyle(
                                          fontSize: size.width * 0.05,
                                          color: isSelectedToday
                                              ? Colors.black
                                              : Colors.grey),
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                isSelectedToday = false;
                                isSelectedLater = true;
                                whenSelected = later;
                                debugPrint('later');
                                setState(() {});
                              },
                              child: Card(
                                elevation: 2,
                                shadowColor: Colors.grey,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      later,
                                      style: TextStyle(
                                          fontSize: size.width * 0.05,
                                          color: isSelectedLater
                                              ? Colors.black
                                              : Colors.grey),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ]))
          ],
        ));
  }
}
