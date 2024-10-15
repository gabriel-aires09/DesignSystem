import 'package:Design_System/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:Design_System/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:Design_System/DesignSystem/shared/styles.dart';
import 'package:Design_System/DesignSystem/shared/ui_helper.dart';
import 'package:Design_System/Views/Login/login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final List<String> functions = [
    'Edit Name',
    'Shipping Info',
    'Notification',
    'Terms & Conditions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            ...functions.map((name) => _buildFunctionItem(name)),
            _buildLogoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        currentIndex: 3,
        viewModel: BottomTabBarViewModel(
          bottomTabs: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Label",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'AvatarProfile.png',
              fit: BoxFit.cover,
            ),
          ),
          verticalSpaceVerySmall,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Amanda Doe',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'amanda@gmail.com',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: paragraph1Regular),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: Text(
          'Logout',
          style: paragraph1Regular.copyWith(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}