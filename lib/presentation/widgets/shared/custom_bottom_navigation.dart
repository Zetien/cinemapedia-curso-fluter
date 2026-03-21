import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustonBottomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustonBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D0221), // violeta muy oscuro
            Color(0xFF3A1F8F), // violeta azulado medio
            Color(0xFF6A4CE0), // violeta azulado vibrante
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => onItemTapped(context, value),
        elevation: 0,
        backgroundColor: Colors.transparent, // 👈 clave para ver el degradado
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max, size: 35,),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumbs_up_down_outlined,size: 35,),
            label: 'Populares',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, size: 35,),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}