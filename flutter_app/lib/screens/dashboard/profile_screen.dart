import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../../models/user.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/validators.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();
  
  bool _isEditing = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _loadUserData() {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.currentUser;
    
    if (user != null) {
      _nameController.text = user.name;
      _emailController.text = user.email;
      _phoneController.text = user.phone ?? '';
      _bioController.text = user.bio ?? '';
    }
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final authService = Provider.of<AuthService>(context, listen: false);
      
      // ✅ Fixed method call to use updateProfile properly
      final result = await authService.updateProfile(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        // Don't include phone and bio if they're not supported in updateProfile method
        // phone: _phoneController.text.trim(),
        // bio: _bioController.text.trim(),
      );

      if (result.success && mounted) {
        AppHelpers.showSnackBar(
          context,
          AppConstants.updateSuccessMessage,
          type: SnackBarType.success,  // ✅ Fixed to use SnackBarType
        );
        setState(() => _isEditing = false);
      } else if (mounted) {
        AppHelpers.showSnackBar(
          context,
          'Failed to update profile',
          type: SnackBarType.error,  // ✅ Fixed to use SnackBarType
        );
      }
    } catch (e) {
      if (mounted) {
        AppHelpers.showSnackBar(
          context,
          'An error occurred while updating profile',
          type: SnackBarType.error,  // ✅ Fixed to use SnackBarType
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser;
        
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              children: [
                // Profile Header
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
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            backgroundImage: user?.avatar != null
                                ? NetworkImage(user!.avatar!)
                                : null,
                            child: user?.avatar == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          if (_isEditing)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.camera_alt),
                                  onPressed: () {
                                    // Handle avatar upload
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.paddingMedium),
                      Text(
                        user?.name ?? 'User',
                        style: AppConstants.subheadingStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppConstants.paddingSmall),
                      Text(
                        user?.email ?? '',
                        style: AppConstants.bodyStyle.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Profile Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Name Field
                      TextFormField(
                        controller: _nameController,
                        enabled: _isEditing,
                        decoration: AppConstants.inputDecoration(
                          'Full Name',
                          prefixIcon: const Icon(Icons.person_outlined),
                        ),
                        validator: AppValidators.validateName,
                      ),
                      
                      const SizedBox(height: AppConstants.paddingMedium),
                      
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        enabled: _isEditing,
                        keyboardType: TextInputType.emailAddress,
                        decoration: AppConstants.inputDecoration(
                          'Email',
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        validator: AppValidators.validateEmail,
                      ),
                      
                      const SizedBox(height: AppConstants.paddingMedium),
                      
                      // Phone Field (Display only for now since updateProfile doesn't support it)
                      TextFormField(
                        controller: _phoneController,
                        enabled: false, // ✅ Disabled since updateProfile method doesn't support phone
                        keyboardType: TextInputType.phone,
                        decoration: AppConstants.inputDecoration(
                          'Phone Number',
                          prefixIcon: const Icon(Icons.phone_outlined),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            return AppValidators.validatePhone(value);
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: AppConstants.paddingMedium),
                      
                      // Bio Field (Display only for now since updateProfile doesn't support it)
                      TextFormField(
                        controller: _bioController,
                        enabled: false, // ✅ Disabled since updateProfile method doesn't support bio
                        maxLines: 3,
                        decoration: AppConstants.inputDecoration(
                          'Bio',
                          hintText: 'Tell us about yourself...',
                          prefixIcon: const Icon(Icons.info_outlined),
                        ),
                        validator: (value) => AppValidators.validateMaxLength(
                          value,
                          200,
                          fieldName: 'Bio',
                        ),
                      ),
                      
                      const SizedBox(height: AppConstants.paddingLarge),
                      
                      // Action Buttons
                      if (_isEditing) ...[
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _isLoading ? null : () {
                                  setState(() {
                                    _isEditing = false;
                                    _loadUserData(); // Reset form
                                  });
                                },
                                style: AppConstants.outlinedButtonStyle,
                                child: const Text('Cancel'),
                              ),
                            ),
                            const SizedBox(width: AppConstants.paddingMedium),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _updateProfile,
                                style: AppConstants.elevatedButtonStyle,
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Text('Save Changes'),
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _isEditing = true);
                            },
                            style: AppConstants.elevatedButtonStyle,
                            child: const Text('Edit Profile'),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Profile Stats
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Statistics',
                          style: AppConstants.subheadingStyle,
                        ),
                        const SizedBox(height: AppConstants.paddingMedium),
                        _buildStatItem('Member Since', 'Jan 2024'),
                        _buildStatItem('Projects', '12'),
                        _buildStatItem('Tasks Completed', '48'),
                        _buildStatItem('Messages Sent', '156'),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: AppConstants.paddingLarge),
                
                // Settings and Actions
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.lock_outlined),
                        title: const Text('Change Password'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.of(context).pushNamed('/change-password');
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.notifications_outlined),
                        title: const Text('Notification Settings'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.of(context).pushNamed('/notification-settings');
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.security_outlined),
                        title: const Text('Privacy Settings'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.of(context).pushNamed('/privacy-settings');
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.help_outlined),
                        title: const Text('Help & Support'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          Navigator.of(context).pushNamed('/help');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppConstants.bodyStyle,
          ),
          Text(
            value,
            style: AppConstants.bodyStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: AppConstants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}