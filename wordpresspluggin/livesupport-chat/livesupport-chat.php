<?php
/**
 * Plugin Name: LiveSupport Chat Widget
 * Plugin URI: https://agileproject.site
 * Description: Add LiveSupport chat widget to your WordPress site. Get real-time customer support with just your widget ID.
 * Version: 1.0.0
 * Author: LiveSupport
 * Author URI: https://agileproject.site
 * License: GPL v2 or later
 * Text Domain: livesupport-chat
 * Domain Path: /languages
 */

// Prevent direct access
if (!defined('ABSPATH')) {
    exit;
}

// Define plugin constants
define('LIVESUPPORT_PLUGIN_URL', plugin_dir_url(__FILE__));
define('LIVESUPPORT_PLUGIN_PATH', plugin_dir_path(__FILE__));
define('LIVESUPPORT_PLUGIN_VERSION', '1.0.0');

// Include required files
require_once LIVESUPPORT_PLUGIN_PATH . 'includes/class-livesupport.php';
require_once LIVESUPPORT_PLUGIN_PATH . 'includes/functions.php';

// Initialize the plugin
function livesupport_init() {
    new LiveSupport_Chat();
}
add_action('plugins_loaded', 'livesupport_init');

// Activation hook
register_activation_hook(__FILE__, 'livesupport_activate');
function livesupport_activate() {
    // Add default options
    add_option('livesupport_widget_id', '');
    add_option('livesupport_enabled', 1);
    add_option('livesupport_position', 'bottom-right');
}

// Deactivation hook
register_deactivation_hook(__FILE__, 'livesupport_deactivate');
function livesupport_deactivate() {
    // Clean up if needed
}

// Uninstall hook
register_uninstall_hook(__FILE__, 'livesupport_uninstall');
function livesupport_uninstall() {
    // Remove options
    delete_option('livesupport_widget_id');
    delete_option('livesupport_enabled');
    delete_option('livesupport_position');
}