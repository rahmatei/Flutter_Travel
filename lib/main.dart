import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/models/travel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMain(),
    );
  }
}

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double sizeItemPic = 55;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.58,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(listTravel[_index].img.toString()),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(104, 240, 240, 240),
                          ),
                          child: const Icon(CupertinoIcons.arrow_left),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(104, 240, 240, 240),
                          ),
                          child: const Icon(CupertinoIcons.heart),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    right: 7,
                    child: SizedBox(
                      width: 70,
                      height: double.maxFinite,
                      child: ListView.builder(
                        itemCount: listTravel.length,
                        itemBuilder: (context, index) {
                          return itemPic(index, sizeItemPic);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 70,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listTravel[_index].name.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.placemark_fill,
                                color: Colors.white,
                              ),
                              Text(
                                listTravel[_index].location.toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      itemCard(
                          'Distance', listTravel[_index].distance.toString()),
                      itemCard('Temp', listTravel[_index].temp.toString()),
                      itemCard('Rating', listTravel[_index].rating.toString()),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description'),
                        Text(listTravel[_index].description.toString()),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text('Total Price'),
                                Text(
                                  "${listTravel[_index].price.toString()}\$",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: const Icon(
                                CupertinoIcons.arrow_right,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget itemCard(String nameCard, String valueCard) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.black26, width: 1),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nameCard),
              const SizedBox(
                height: 20,
              ),
              Text(valueCard),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemPic(int index, double sizeItemPic) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          setState(() {
            _index = index;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: sizeItemPic,
          height: sizeItemPic,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                listTravel[index].img.toString(),
              ),
              fit: BoxFit.fill,
            ),
            border: Border.all(
                color: _index == index
                    ? const Color.fromARGB(255, 7, 7, 8)
                    : Colors.white,
                width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
