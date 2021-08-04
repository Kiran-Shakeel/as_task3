import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  _HomeBarState createState() => _HomeBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50);
}

class _HomeBarState extends State<HomeBar> {
  static int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            onPressed: () {}, icon: Icon(Icons.settings_outlined));
      }),
      title: Text("Photos"),
      actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.search))],

      //bottom
      bottom: TabBar(
        onTap: (index) {
          setState(() {
            print(_currentIndex);

            _currentIndex = index;
          });
        },
        unselectedLabelColor: Colors.white,
        labelColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        isScrollable: true,
        tabs: items.map<Widget>((TabItems choice) {
          return Expanded(
            child: Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(choice.iconData),
                  SizedBox()
                ],
              ),
              // icon: Icon(choice.iconData),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TabItems {
  final IconData iconData;
  const TabItems({
    required this.iconData,
  });
}

const List<TabItems> items = <TabItems>[
  TabItems(iconData: Icons.photo_outlined),
  TabItems(iconData: CupertinoIcons.compass),
  TabItems(iconData: Icons.note_outlined),
];
