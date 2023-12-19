import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_app/network/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getData() async {
    dataList = await ApiService().getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        title: const Text(
          "FoodFanda",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.list,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 238, 238, 238),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Popular items"),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: dataList.isNotEmpty
                    ? ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(dataList[index]['title'] ?? ""),
                                    subtitle:
                                        Text(dataList[index]['author'] ?? ""),
                                  ),
                                  SizedBox(
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.network(
                                      dataList[index]['urlToImage'] ?? "",
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                        height: 150,
                                        color: const Color.fromARGB(
                                            255, 214, 214, 214),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
