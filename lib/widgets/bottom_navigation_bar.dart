import 'package:flutter/material.dart';
import '../views/home_screen.dart';
import '../views/notification_screen.dart';
import '../views/profile_screen.dart';
import '../views/wish_list_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      const WishListScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Web için yan navigasyon menüsü
          NavigationRail(
            extended: MediaQuery.of(context).size.width > 800,
            minExtendedWidth: 200,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/logo.png',
                height: 40,
              ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Ana Sayfa'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('İstek Listesi'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications),
                label: Text('Bildirimler'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profil'),
              ),
            ],
          ),
          // Dikey çizgi ayırıcı
          const VerticalDivider(thickness: 1, width: 1),
          // Seçili ekranın içeriği
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
