import 'package:as_task3/theme/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: items.length,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
              extendBody: true,
              appBar: HomeBar(),
              body: TabBarView(
                children: items.map((TabItems choice) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: GalleryPage(
                      index: DefaultTabController.of(context)!.index,
                    ),
                  );
                }).toList(),
              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(bottom: 30, left: 32, right: 32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 70,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(
                               
                                Icons.camera_alt_outlined,
                                color: Colors.teal,
                              ),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.photo_outlined,
                                color: Colors.pink,
                              ),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.blue),
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.close)),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(
                                CupertinoIcons.compass,
                                color: Colors.yellow,
                              ),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.note_outlined,
                                color: Colors.purple,
                              ),
                              label: ''),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}

class GalleryPage extends StatefulWidget {
  final int index;
  const GalleryPage({Key? key, required this.index}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(21, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "asset/images/$index.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            })),
      ),
    ]);
  }
}
