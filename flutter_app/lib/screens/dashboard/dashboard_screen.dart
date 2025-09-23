import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
// ✅ Add these missing imports:
import '../chat/chat_list_screen.dart';
import '../visitors/visitors_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<DashboardTab> _tabs = [
    DashboardTab(
      icon: Icons.dashboard,
      label: 'Dashboard',
      page: const DashboardHomeScreen(),
    ),
    DashboardTab(
      icon: Icons.chat,
      label: 'Messages',
      page: const ChatListScreen(),
    ),
    DashboardTab(
      icon: Icons.people,
      label: 'Visitors',
      page: const VisitorsScreen(),
    ),
    DashboardTab(
      icon: Icons.person,
      label: 'Profile',
      page: const ProfileScreen(),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: AppConstants.animationMedium,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_selectedIndex].label),
        elevation: 0,
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              switch (value) {
                case 'settings':
                  Navigator.of(context).pushNamed('/settings');
                  break;
                case 'logout':
                  final confirmed = await AppHelpers.showConfirmDialog(
                    context,
                    'Logout',
                    'Are you sure you want to logout?',
                  );
                  if (confirmed && mounted) {
                    final authService = Provider.of<AuthService>(context, listen: false);
                    await authService.logout();
                    Navigator.of(context).pushReplacementNamed('/login');
                  }
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: _tabs.map((tab) => tab.page).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        selectedItemColor: AppConstants.primaryColor,
        unselectedItemColor: Colors.grey,
        items: _tabs.map((tab) => BottomNavigationBarItem(
          icon: Icon(tab.icon),
          label: tab.label,
        )).toList(),
      ),
    );
  }
}

class DashboardTab {
  final IconData icon;
  final String label;
  final Widget page;

  DashboardTab({
    required this.icon,
    required this.label,
    required this.page,
  });
}

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser;
        
        return RefreshIndicator(
          onRefresh: () async {
            // Refresh dashboard data
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppConstants.paddingLarge),
                  decoration: AppConstants.cardDecoration.copyWith(
                    gradient: LinearGradient(
                      colors: [
                        AppConstants.primaryColor,
                        AppConstants.primaryColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back, ${user?.name ?? 'User'}!',
                        style: AppConstants.subheadingStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        'Here\'s your project overview',
                        style: AppConstants.bodyStyle.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Stats Cards
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: 'Projects',
                        value: '12',
                        icon: Icons.folder,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingMedium),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Tasks',
                        value: '48',
                        icon: Icons.task,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppConstants.paddingMedium),
                
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: 'Messages',
                        value: '23',
                        icon: Icons.message,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingMedium),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Visitors',
                        value: '156',
                        icon: Icons.people,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Recent Activities
                Text(
                  'Recent Activities',
                  style: AppConstants.subheadingStyle,
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                
                Card(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppConstants.primaryColor.withOpacity(0.1),
                          child: Icon(
                            Icons.notifications,
                            color: AppConstants.primaryColor,
                          ),
                        ),
                        title: Text('Activity ${index + 1}'),
                        subtitle: Text('Description of activity ${index + 1}'),
                        trailing: Text(
                          '${index + 1}h ago',
                          style: AppConstants.captionStyle,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: AppConstants.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: color,
                size: 24,
              ),
              Text(
                value,
                style: AppConstants.headingStyle.copyWith(
                  color: color,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Text(
            title,
            style: AppConstants.bodyStyle.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}