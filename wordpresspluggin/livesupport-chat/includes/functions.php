<?php
/**
 * Helper Functions
 */

if (!defined('ABSPATH')) {
    exit;
}

/**
 * Check if LiveSupport widget is enabled
 */
function livesupport_is_enabled() {
    return get_option('livesupport_enabled', 1);
}

/**
 * Get LiveSupport widget ID
 */
function livesupport_get_widget_id() {
    return get_option('livesupport_widget_id', '');
}

/**
 * Get LiveSupport widget position
 */
function livesupport_get_position() {
    return get_option('livesupport_position', 'bottom-right');
}

/**
 * Validate widget ID format
 */
function livesupport_is_valid_widget_id($widget_id) {
    // Widget IDs should be 32 characters hex string
    return preg_match('/^[a-f0-9]{32}$/', $widget_id);
}

/**
 * Manual widget insertion (for theme developers)
 * Usage: <?php livesupport_display_widget(); ?>
 */
function livesupport_display_widget() {
    if (livesupport_is_enabled() && !empty(livesupport_get_widget_id())) {
        include LIVESUPPORT_PLUGIN_PATH . 'includes/widget-loader.php';
    }
}

/**
 * Shortcode for widget insertion
 * Usage: [livesupport]
 */
function livesupport_shortcode($atts) {
    $atts = shortcode_atts(array(
        'id' => livesupport_get_widget_id(),
        'position' => livesupport_get_position()
    ), $atts);
    
    if (empty($atts['id'])) {
        return '';
    }
    
    ob_start();
    ?>
    <script>
        window.WIDGET_ID = "<?php echo esc_js($atts['id']); ?>";
        window.LIVESUPPORT_POSITION = "<?php echo esc_js($atts['position']); ?>";
    </script>
    <script src="https://agileproject.site/widget/embed.js" async></script>
    <?php
    return ob_get_clean();
}
add_shortcode('livesupport', 'livesupport_shortcode');