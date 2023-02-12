import 'package:flutter/material.dart';
import 'package:task_list/screen/AddTaskScreen/AddTaskScreen.dart';
import 'package:task_list/utils/CommonThings/commonThings.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> todayList=[];
  List<String> laterList=[];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddTaskScreen()))
                .then((value) async => {
                  if(value!=null){
                    todayList.add(value)
                  }else{

                  },
              debugPrint("value $value")
            });
            setState(() {});
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            titleApp,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///Today
              Row(
                children: [
                  Text(
                    today,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.width * 0.05),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=2000&q=60'),
                      child: ClipRRect(
                        child: Text('0'),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                  itemCount: todayList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(size.width * 0.0),
                          width: double.infinity,
                          child: Card(
                            shadowColor: Colors.grey,
                            elevation: 2,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: size.width * 0.025,
                                        backgroundColor: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: size.width * 0.02,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            todayList[index],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.05),
                                          ),
                                          Text(
                                            "description",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: size.width * 0.03),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: Colors.black,
                                      width: 1,
                                      thickness: 3,
                                      indent: 1,
                                      endIndent: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),

              ///Later To Do
              Row(
                children: [
                  Text(
                    later,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.04),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.width * 0.05),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1661956602139-ec64991b8b16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=2000&q=60'),
                      child: ClipRRect(
                        child: Text('0'),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                itemCount: laterList.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, idx) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(size.width * 0.0),
                      width: double.infinity,
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 2,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: size.width * 0.025,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: size.width * 0.02,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Today work",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.width * 0.05),
                                      ),
                                      Text(
                                        "description",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: size.width * 0.03),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                                child: VerticalDivider(
                                  color: Colors.black,
                                  width: 1,
                                  thickness: 3,
                                  indent: 1,
                                  endIndent: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
