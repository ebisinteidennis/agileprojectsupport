import 'package:flutter/material.dart';
import '../../models/visitor.dart';
import '../../services/api_service.dart';
import '../../config/api_endpoints.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class VisitorsScreen extends StatefulWidget {
  const VisitorsScreen({super.key});

  @override
  State<VisitorsScreen> createState() => _VisitorsScreenState();
}

class _VisitorsScreenState extends State<VisitorsScreen>
    with SingleTickerProviderStateMixin {
  
  late TabController _tabController;
  final ApiService _apiService = ApiService();
  
  VisitorStats? _stats;
  List<Visitor> _visitors = [];
  bool _isLoading = true;
  String _selectedPeriod = 'today';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    try {
      final [statsResponse, visitorsResponse] = await Future.wait([
        _apiService.get<VisitorStats>(
          ApiEndpoints.getVisitorStats,
          queryParameters: {'period': _selectedPeriod},
          fromJson: (json) => VisitorStats.fromJson(json),
        ),
        _apiService.get<List<Visitor>>(
          ApiEndpoints.getVisitors,
          queryParameters: {'period': _selectedPeriod},
          fromJson: (json) => (json as List)
              .map((item) => Visitor.fromJson(item))
              .toList(),
        ),
      ]);

      if (mounted) {
        setState(() {
          _stats = statsResponse.data;
          _visitors = visitorsResponse.data ?? [];
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        AppHelpers.showSnackBar(
          context,
          'Failed to load visitor data',
          type: MessageType.error,
        );
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Period Selector
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPeriod,
                    decoration: AppConstants.inputDecoration('Time Period'),
                    items: const [
                      DropdownMenuItem(value: 'today', child: Text('Today')),
                      DropdownMenuItem(value: 'week', child: Text('This Week')),
                      DropdownMenuItem(value: 'month', child: Text('This Month')),
                      DropdownMenuItem(value: 'year', child: Text('This Year')),
                    ],
                    onChanged: (value) {
                      if (value != null && value != _selectedPeriod) {
                        setState(() => _selectedPeriod = value);
                        _loadData();
                      }
                    },
                  ),
                ),
                const SizedBox(width: AppConstants.paddingMedium),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _loadData,
                ),
              ],
            ),
          ),
          
          // Tab Bar
          TabBar(
            controller: _tabController,
            labelColor: AppConstants.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppConstants.primaryColor,
            tabs: const [
              Tab(text: 'Statistics', icon: Icon(Icons.bar_chart)),
              Tab(text: 'Visitor List', icon: Icon(Icons.list)),
            ],
          ),
          
          // Tab Views
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : TabBarView(
                    controller: _tabController,
                    children: [
                      _buildStatisticsTab(),
                      _buildVisitorListTab(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsTab() {
    if (_stats == null) {
      return const Center(child: Text('No statistics available'));
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: AppConstants.paddingMedium,
              mainAxisSpacing: AppConstants.paddingMedium,
              childAspectRatio: 1.5,
              children: [
                _buildStatCard(
                  'Total Visitors',
                  _stats!.totalVisitors.toString(),
                  Icons.people,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Unique Visitors',
                  _stats!.uniqueVisitors.toString(),
                  Icons.person,
                  Colors.green,
                ),
                _buildStatCard(
                  'Page Views',
                  _stats!.totalPageViews.toString(),
                  Icons.visibility,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Avg. Duration',
                  '${_stats!.averageDuration.toStringAsFixed(1)}min',
                  Icons.timer,
                  Colors.purple,
                ),
              ],
            ),
            
            const SizedBox(height: AppConstants.paddingLarge),
            
            // Top Countries
            if (_stats!.topCountries.isNotEmpty) ...[
              Text(
                'Top Countries',
                style: AppConstants.subheadingStyle,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _stats!.topCountries.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final country = _stats!.topCountries[index];
                    return ListTile(
                      title: Text(country.country),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            country.visitors.toString(),
                            style: AppConstants.bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${country.percentage.toStringAsFixed(1)}%',
                            style: AppConstants.captionStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: AppConstants.paddingLarge),
            ],
            
            // Top Pages
            if (_stats!.topPages.isNotEmpty) ...[
              Text(
                'Top Pages',
                style: AppConstants.subheadingStyle,
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _stats!.topPages.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final page = _stats!.topPages[index];
                    return ListTile(
                      title: Text(
                        page.page,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            page.views.toString(),
                            style: AppConstants.bodyStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${page.percentage.toStringAsFixed(1)}%',
                            style: AppConstants.captionStyle,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildVisitorListTab() {
    return RefreshIndicator(
      onRefresh: _loadData,
      child: _visitors.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: _visitors.length,
              itemBuilder: (context, index) {
                final visitor = _visitors[index];
                return _buildVisitorTile(visitor);
              },
            ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: AppConstants.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(
                value,
                style: AppConstants.headingStyle.copyWith(
                  color: color,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Spacer(),
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

  Widget _buildVisitorTile(Visitor visitor) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingSmall),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: visitor.isUnique
              ? AppConstants.successColor.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          child: Icon(
            visitor.isUnique ? Icons.person : Icons.repeat,
            color: visitor.isUnique ? AppConstants.successColor : Colors.grey,
          ),
        ),
        title: Text(
          visitor.ipAddress,
          style: const TextStyle(fontFamily: 'monospace'),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (visitor.country != null)
              Text('${visitor.country}${visitor.city != null ? ', ${visitor.city}' : ''}'),
            Text('Page: ${visitor.visitedPage}'),
            Text('${visitor.timestamp.relativeTime} • ${visitor.duration}s'),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (visitor.deviceType != null)
              Text(
                visitor.deviceType!.capitalize,
                style: AppConstants.captionStyle,
              ),
            Text(
              '${visitor.pageViews} views',
              style: AppConstants.captionStyle,
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          Text(
            'No visitors found',
            style: AppConstants.subheadingStyle.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: AppConstants.paddingSmall),
          Text(
            'Visitor data will appear here when available',
            style: AppConstants.bodyStyle.copyWith(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}