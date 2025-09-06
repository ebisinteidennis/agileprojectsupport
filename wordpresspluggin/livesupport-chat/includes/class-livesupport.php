<?php
/**
 * Main LiveSupport Chat Plugin Class
 */

if (!defined('ABSPATH')) {
    exit;
}

class LiveSupport_Chat {
    
    public function __construct() {
        add_action('init', array($this, 'init'));
    }
    
    public function init() {
        // Add admin menu
        add_action('admin_menu', array($this, 'add_admin_menu'));
        
        // Add settings
        add_action('admin_init', array($this, 'register_settings'));
        
        // Load widget on frontend
        add_action('wp_footer', array($this, 'load_widget'));
        
        // Add settings link to plugins page
        add_filter('plugin_action_links_' . plugin_basename(LIVESUPPORT_PLUGIN_PATH . 'livesupport-chat.php'), 
                   array($this, 'add_settings_link'));
    }
    
    /**
     * Add admin menu
     */
    public function add_admin_menu() {
        add_options_page(
            'LiveSupport Chat Settings',
            'LiveSupport Chat',
            'manage_options',
            'livesupport-chat',
            array($this, 'admin_page')
        );
    }
    
    /**
     * Register settings
     */
    public function register_settings() {
        register_setting('livesupport_settings', 'livesupport_widget_id');
        register_setting('livesupport_settings', 'livesupport_enabled');
        register_setting('livesupport_settings', 'livesupport_position');
    }
    
    /**
     * Admin page
     */
    public function admin_page() {
        include LIVESUPPORT_PLUGIN_PATH . 'admin/admin.php';
    }
    
    /**
     * Load widget on frontend
     */
    public function load_widget() {
        $widget_id = get_option('livesupport_widget_id');
        $enabled = get_option('livesupport_enabled', 1);
        
        // Only load if enabled and widget ID is set
        if ($enabled && !empty($widget_id)) {
            include LIVESUPPORT_PLUGIN_PATH . 'includes/widget-loader.php';
        }
    }
    
    /**
     * Add settings link to plugins page
     */
    public function add_settings_link($links) {
        $settings_link = '<a href="options-general.php?page=livesupport-chat">Settings</a>';
        array_unshift($links, $settings_link);
        return $links;
    }
}