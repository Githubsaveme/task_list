import 'dart:math';

import 'package:flutter/material.dart';

import 'addTaskScreen/addTaskScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  TextEditingController listController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();

  List<String> addList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  AddTaskScreen(finalSearchList: addList,)));
                },
                icon: const Icon(Icons.search))
          ],
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.width * 0.1),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    ElevatedButton(
                        onPressed: () {
                          if (formGlobalKey.currentState!.validate()) {
                            addList.add(listController.text);
                            listController.clear();
                          } else {
                            debugPrint('write something');
                          }
                          setState(() {});
                        },
                        child: const Text('Add')),
                    addList.isNotEmpty
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(size.width * 0.05),
                            itemCount: addList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                padding: EdgeInsets.all(size.width * 0.02),
                                transform: Matrix4.rotationZ(0.1),
                                decoration: BoxDecoration(
                                    color: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.05)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      addList[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          addList.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: size.height * 0.02,
                              );
                            },
                          )
                        : const Center(
                            child: Text('Please add you\'re first to do')),
                  ]),
            ),
          ),
        ]))
      ],
    ));
  }
}
