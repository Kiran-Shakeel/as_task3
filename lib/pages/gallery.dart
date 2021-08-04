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
            appBar: HomeBar(),
            body: TabBarView(
              children: items.map((TabItems choice) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: GalleryPage(
                    index: DefaultTabController.of(context)!.index,
                  ),
                );
              }).toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
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
                BottomNavigationBarItem(icon: Icon(Icons.close), label: ''),
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
          );
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
            crossAxisCount: 4,
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
