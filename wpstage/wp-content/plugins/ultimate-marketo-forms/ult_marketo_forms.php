<?php

/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              http://www.hyperxmedia.com
 * @since             1.0.0
 * @package           Ultimate Marketo_forms
 *
 * @wordpress-plugin
 * Plugin Name:       Ultimate Marketo Forms
 * Plugin URI:        http://www.hyperxmedia.com/ultimate-marketo-forms-wordpress-plugin/
 * Description:       The Ultimate Marketo Forms for WordPress plugin enables auto-fill, progressive profiling, custom confirmation page logic, and more with a simple install.
 * Version:           1.0.16
 * Author:            HyperX Media
 * Author URI:        http://www.hyperxmedia.com
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       ultimate_ult_marketo_forms
 * Domain Path:       /languages
 */
$mylog = '';
$cur_version = '1.0.16';


// If this file is called directly, abort.
if ( ! defined( 'WPINC' ) ) {
	die;
}

/**
 * The code that runs during plugin activation.
 * This action is documented in includes/class-ult_marketo_forms-activator.php
 */
function activate_ult_marketo_forms() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-ult_marketo_forms-activator.php';
	Marketo_forms_Activator::activate();
}

/**
 * The code that runs during plugin deactivation.
 * This action is documented in includes/class-ult_marketo_forms-deactivator.php
 */
function deactivate_ult_marketo_forms() {
	require_once plugin_dir_path( __FILE__ ) . 'includes/class-ult_marketo_forms-deactivator.php';
	Marketo_forms_Deactivator::deactivate();
}

register_activation_hook( __FILE__, 'activate_ult_marketo_forms' );
register_deactivation_hook( __FILE__, 'deactivate_ult_marketo_forms' );

/**
 * The core plugin class that is used to define internationalization,
 * admin-specific hooks, and public-facing site hooks.
 */
require plugin_dir_path( __FILE__ ) . 'includes/class-ult_marketo_forms.php';

/**
 * Begins execution of the plugin.
 *
 * Since everything within the plugin is registered via hooks,
 * then kicking off the plugin from this point in the file does
 * not affect the page life cycle.
 *
 * @since    1.0.0
 */
function run_ult_marketo_forms() {


	$plugin = new Marketo_forms();
	$plugin->run();

}
run_ult_marketo_forms();
