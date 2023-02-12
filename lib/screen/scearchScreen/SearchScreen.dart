import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List finalSearchList;

  const SearchScreen({Key? key, required this.finalSearchList})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  List<String> searchList = [];
  List<dynamic> addList = [];

  @override
  void initState() {
    debugPrint("widgetScreen:${widget.finalSearchList}");
    addList = widget.finalSearchList.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(size.width * 0.02),
        child: Column(
          children: [
            taskSearch(size),
            addScreenWidget(size),
          ],
        ),
      ),
    );
  }

  Widget taskSearch(size) {
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
        top: size.width * 0.01,
      ),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.only(
        top: size.width * 0.05,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: searchController,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        onChanged: (value) {
          if (searchController.text.isNotEmpty) {
            isSearch = true;
            searchList.clear();
            for (var item in addList) {
              if (item
                  .toLowerCase()
                  .startsWith(searchController.text.toLowerCase())) {
                searchList.add(item);
              }
              debugPrint("search: ${searchList.length}");
            }
          } else {
            isSearch = false;
            searchList.clear();
          }
          setState(() {});
        },
        style: TextStyle(fontSize: size.width * 0.035, color: Colors.white),
        decoration: InputDecoration(
          prefix: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: "",
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: Colors.grey,
          filled: true,
          contentPadding: EdgeInsets.only(
            left: size.width * 0.04,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: size.width * 0, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: size.width * 0, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: size.width * 0, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: size.width * 0, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: size.width * 0, color: Colors.grey),
            //<-- SEE HERE
            borderRadius: BorderRadius.circular(size.width * 0.03),
          ),
        ),
      ),
    );
  }

  Widget addScreenWidget(size) {
    return searchList.isNotEmpty
        ? ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(size.width * 0.05),
            itemCount: searchList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    searchList[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                indent: 1,
                endIndent: 5,
                thickness: 1,
                color: Colors.black,
              );
            },
          )
        : const Center(child: Text('Nothing found'));
  }
}
