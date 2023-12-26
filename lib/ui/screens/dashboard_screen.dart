import 'package:figma_shopping_app/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Item1',
    ),
    const Text(
      'Index 1: Item2',
    ),
    const Text(
      'Index 2: Item3',
    ),
    const Text(
      'Index 3: Item4',
    ),
    const Text(
      'Index 4: Item5',
    ),
    const Text(
      'Index 5: Item6',
    ),
    const Text(
      'Index 6: Item7',
    ),
    const Text(
      'Index 7: Item8',
    ),
  ];

  void itemTapped(int index) {
    scaffoldKey.currentState?.closeDrawer();
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Image.asset(Assets.assetsSideDrawerImg),
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions[selectedIndex],
      ),
      drawer: Drawer(
        elevation: 5,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.closeDrawer();
                    },
                    icon: Image.asset(Assets.assetsSideDrawerImg),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Image.asset(Assets.assetsDrawerDpImg),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hemendra",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  fontFamily: "Inter",
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Verified Profile",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF8F959E),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    Assets.assetsDrawerGreenCheck,
                                    width: 15,
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 40,
                              color: Colors.blue,
                              child: const Text("Later"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerSunImg,
                tileText: "Dark Mode",
                textColor: Colors.black,
                wantCupertinoSwitch: true,
              ),
              selected: selectedIndex == 0,
              onTap: () {
                itemTapped(0);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerInfoCircle,
                tileText: 'Account Information',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 1,
              onTap: () {
                itemTapped(1);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerLockImg,
                tileText: 'Password',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 2,
              onTap: () {
                itemTapped(2);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerBagImg,
                tileText: 'Order',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 3,
              onTap: () {
                itemTapped(3);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerWalletImg,
                tileText: 'My Cards',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 4,
              onTap: () {
                itemTapped(4);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerHeartImg,
                tileText: 'Wishlist',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 5,
              onTap: () {
                itemTapped(5);
              },
            ),
            ListTile(
              title: const ListItem(
                assetImage: Assets.assetsDrawerSettingsImg,
                tileText: 'Settings',
                textColor: Colors.black,
              ),
              selected: selectedIndex == 6,
              onTap: () {
                itemTapped(6);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: ListTile(
                title: const ListItem(
                  assetImage: Assets.assetsDrawerLogoutImg,
                  tileText: 'Logout',
                  textColor: Color(0xFFFF5757),
                ),
                selected: selectedIndex == 7,
                onTap: () {
                  itemTapped(7);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.assetImage,
    required this.tileText,
    required this.textColor,
    this.wantCupertinoSwitch = false,
  });

  final String assetImage;
  final String tileText;
  final Color textColor;
  final bool? wantCupertinoSwitch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Image.asset(assetImage),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                tileText,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          ),
          if (wantCupertinoSwitch == true)
            CupertinoSwitch(
              value: false,
              onChanged: (isChecked) {},
            ),
        ],
      ),
    );
  }
}
