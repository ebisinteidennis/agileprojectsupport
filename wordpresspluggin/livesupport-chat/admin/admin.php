<?php
/**
 * Admin Settings Page
 */

if (!defined('ABSPATH')) {
    exit;
}

// Handle form submission
if (isset($_POST['submit'])) {
    if (wp_verify_nonce($_POST['livesupport_nonce'], 'livesupport_settings')) {
        update_option('livesupport_widget_id', sanitize_text_field($_POST['livesupport_widget_id']));
        update_option('livesupport_enabled', isset($_POST['livesupport_enabled']) ? 1 : 0);
        update_option('livesupport_position', sanitize_text_field($_POST['livesupport_position']));
        
        echo '<div class="notice notice-success"><p>Settings saved successfully!</p></div>';
    }
}

// Get current settings
$widget_id = get_option('livesupport_widget_id', '');
$enabled = get_option('livesupport_enabled', 1);
$position = get_option('livesupport_position', 'bottom-right');
?>

<div class="wrap">
    <h1>LiveSupport Chat Settings</h1>
    
    <div class="livesupport-admin-container">
        <div class="livesupport-main-settings">
            <form method="post" action="">
                <?php wp_nonce_field('livesupport_settings', 'livesupport_nonce'); ?>
                
                <table class="form-table">
                    <tr>
                        <th scope="row">
                            <label for="livesupport_widget_id">Widget ID</label>
                        </th>
                        <td>
                            <input type="text" 
                                   id="livesupport_widget_id" 
                                   name="livesupport_widget_id" 
                                   value="<?php echo esc_attr($widget_id); ?>" 
                                   class="regular-text" 
                                   placeholder="Enter your LiveSupport Widget ID"
                                   required />
                            <p class="description">
                                Get your Widget ID from your <a href="https://agileproject.site/account/dashboard.php" target="_blank">LiveSupport Dashboard</a>
                            </p>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">Enable Chat Widget</th>
                        <td>
                            <label>
                                <input type="checkbox" 
                                       name="livesupport_enabled" 
                                       value="1" 
                                       <?php checked($enabled, 1); ?> />
                                Enable LiveSupport chat widget on your website
                            </label>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            <label for="livesupport_position">Widget Position</label>
                        </th>
                        <td>
                            <select id="livesupport_position" name="livesupport_position">
                                <option value="bottom-right" <?php selected($position, 'bottom-right'); ?>>Bottom Right</option>
                                <option value="bottom-left" <?php selected($position, 'bottom-left'); ?>>Bottom Left</option>
                                <option value="top-right" <?php selected($position, 'top-right'); ?>>Top Right</option>
                                <option value="top-left" <?php selected($position, 'top-left'); ?>>Top Left</option>
                            </select>
                            <p class="description">Choose where the chat widget appears on your website</p>
                        </td>
                    </tr>
                </table>
                
                <?php submit_button('Save Settings'); ?>
            </form>
        </div>
        
        <div class="livesupport-sidebar">
            <div class="livesupport-info-box">
                <h3>🚀 Getting Started</h3>
                <ol>
                    <li>Create an account at <a href="https://agileproject.site" target="_blank">LiveSupport</a></li>
                    <li>Get your Widget ID from the dashboard</li>
                    <li>Enter the Widget ID above and enable the chat</li>
                    <li>Your chat widget is now live!</li>
                </ol>
            </div>
            
            <div class="livesupport-info-box">
                <h3>💬 Features</h3>
                <ul>
                    <li>✅ Real-time messaging</li>
                    <li>✅ File sharing</li>
                    <li>✅ Mobile responsive</li>
                    <li>✅ Easy customization</li>
                    <li>✅ Multiple agents</li>
                    <li>✅ Message history</li>
                </ul>
            </div>
            
            <div class="livesupport-info-box">
                <h3>🔧 Need Help?</h3>
                <p>
                    <a href="https://agileproject.site/contact" target="_blank" class="button button-secondary">
                        Contact Support
                    </a>
                </p>
                <p>
                    <a href="https://agileproject.site/docs" target="_blank" class="button button-secondary">
                        View Documentation
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<style>
.livesupport-admin-container {
    display: flex;
    gap: 30px;
    margin-top: 20px;
}

.livesupport-main-settings {
    flex: 2;
}

.livesupport-sidebar {
    flex: 1;
    max-width: 300px;
}

.livesupport-info-box {
    background: #fff;
    border: 1px solid #ccd0d4;
    border-radius: 4px;
    padding: 15px;
    margin-bottom: 20px;
}

.livesupport-info-box h3 {
    margin-top: 0;
    font-size: 16px;
    color: #23282d;
}

.livesupport-info-box ul, 
.livesupport-info-box ol {
    margin: 10px 0 0 20px;
}

.livesupport-info-box li {
    margin-bottom: 5px;
    line-height: 1.5;
}

.livesupport-info-box p {
    margin: 10px 0;
}

@media (max-width: 782px) {
    .livesupport-admin-container {
        flex-direction: column;
    }
    
    .livesupport-sidebar {
        max-width: none;
    }
}
</style>