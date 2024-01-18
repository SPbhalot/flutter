import 'package:flutter/material.dart';
import 'package:practice/digiGold/Dashboard.dart';
import 'package:practice/digiGold/digiGoldInvest.dart';
import 'package:practice/digiGold/digiGoldVault.dart';

class digiGoldMainPage extends StatefulWidget {
  const digiGoldMainPage({Key? key,required int this.index}) : super(key: key);
  final int index;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<digiGoldMainPage> {
  late int _currentIndex = 0;
   @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Visibility(
        visible: true,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Invest',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: 'Vault',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedFontSize: 14.0, 
          unselectedFontSize: 14.0, 
          selectedItemColor:
              Colors.blue, 
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey), //
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
      case 1:
      return Dashboard();
      case 2:
      case 3:
        return digiGoldInvest();
      case 4:
        return digiGoldVault(); // Assume you want the same content for Vault and Profile
      default:
        return Container();
    }
  }
}
