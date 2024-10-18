import 'package:Design_System/DesignSystem/design_system.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProfileHeader(
              assetPath: 'AvatarProfile.png', 
              name: 'Amanda Doe', 
              email: 'amanda@gmail.com'
            ),
            
            verticalSpaceRegular,
            ...functions.map((name) => _buildFunctionItem(name)),
            _buildLogoutButton(
              context: context, 
              text: 'Logout'
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(
        navNameOne: 'Home',
        navNameTwo: 'Messages',
        navNameThree: 'Label',
        navNameFour: 'Profile',
      ),
    );
  }

  AppBar _buildAppBar({required String title}) {
    return AppBar(
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontFamily: 'Inter',
        color: blackTextColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      titleSpacing: 30,
    );
  }

  Widget _buildProfileHeader({
    required String assetPath,
    required String name,
    required String email,
  }) {
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
              assetPath,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpaceVerySmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: blackTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: greyTextColor,
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

  Widget _buildLogoutButton({
    required BuildContext context,
    required String text,
    }) {	
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
          text,
          style: paragraph1Regular.copyWith(
            color: redTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar({
    required String navNameOne,
    required String navNameTwo,
    required String navNameThree,
    required String navNameFour,
  }) {
    return BottomTabBar.instantiate(
      currentIndex: 3,
      viewModel: BottomTabBarViewModel(
        bottomTabs:  [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: navNameOne,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: navNameTwo,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.label),
            label: navNameThree,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: navNameFour,
          ),
        ],
      ),
    );
  }

  final List<String> functions = [
    'Edit Profile',
    'Change Password',
    'Settings',
    'Help',
  ];
}