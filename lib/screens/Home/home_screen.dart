import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/constants.dart';
import 'package:flutter_firebase/interfaces/app_bar_component.dart';
import 'package:flutter_firebase/screens/Calls/calls_screen.dart';
import 'package:flutter_firebase/screens/Contacts/contacts_screen.dart';
import 'package:flutter_firebase/screens/Messages/components/messages_components.dart';
import 'package:flutter_firebase/screens/Messages/messages_screen.dart';
import 'package:flutter_firebase/screens/NewChat/new_chat_screen.dart';
import 'package:flutter_firebase/screens/Settings/components/settings_components.dart';
import 'package:flutter_firebase/screens/Settings/settings_screen.dart';
import 'package:flutter_firebase/services/auth_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  late AuthService _authService;
  late AppBarComponent _componentProvider;
  PersistentTabController _navController =
      PersistentTabController(initialIndex: 3);
  final Key _navKey = Key('bottom_navigation');

  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthService>(context);
    size = MediaQuery.of(context).size;
    setComponentProvider();
    _navController.addListener(() {
      setState(() {
        setComponentProvider();
      });
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: _buildLeadingIcon(),
        centerTitle: true,
        title: _buildTitle(),
        actions: _buildActions(),
      ),
      body: PersistentTabView(
        context,
        key: _navKey,
        controller: _navController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: false,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 300),
        ),
        navBarStyle: NavBarStyle.style15,
        padding: NavBarPadding.only(bottom: size.height * 0.01),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      ContactsScreen(),
      CallsScreen(),
      Container(),
      MessagesScreen(),
      SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_2_fill),
        title: 'Contacts',
        activeColorPrimary: kBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.phone_fill),
        title: 'Calls',
        activeColorPrimary: kBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        textStyle: TextStyle(
          color: Colors.transparent,
        ),
        activeColorPrimary: kBlue,
        onPressed: (context) {
          showMaterialModalBottomSheet(
            context: this.context,
            builder: (_) => NewChatScreen(),
            backgroundColor: Colors.transparent,
          );
        },
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.chat_bubble_2_fill),
        title: 'Messages',
        activeColorPrimary: kBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.gear_solid),
        title: 'Settings',
        activeColorPrimary: kBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  Widget _buildLeadingIcon() {
    return _componentProvider.getLeadingIcon();
  }

  Widget _buildTitle() {
    return _componentProvider.getTitle();
  }

  List<Widget> _buildActions() {
    return _componentProvider.getActions(_authService.currentUser);
  }

  void setComponentProvider() {
    switch (_navController.index) {
      case 4:
        _componentProvider = SettingsComponents();
        break;
      default:
        _componentProvider = MessagesComponents();
    }
  }
}
