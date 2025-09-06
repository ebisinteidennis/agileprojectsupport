<?php
/**
 * Widget Loader - Outputs the LiveSupport widget script
 */

if (!defined('ABSPATH')) {
    exit;
}

$widget_id = get_option('livesupport_widget_id');
$position = get_option('livesupport_position', 'bottom-right');

if (empty($widget_id)) {
    return;
}
?>

<!-- LiveSupport Chat Widget -->
<script>
    window.WIDGET_ID = "<?php echo esc_js($widget_id); ?>";
    window.LIVESUPPORT_POSITION = "<?php echo esc_js($position); ?>";
</script>
<script src="https://agileproject.site/widget/embed.js" async></script>
<!-- End LiveSupport Chat Widget -->