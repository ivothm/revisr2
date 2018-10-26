<?php

/**
 * The file that defines the core plugin class
 *
 * A class definition that includes attributes and functions used across both the
 * public-facing side of the site and the admin area.
 *
 * @link       http://hyperxmedia.com
 * @since      1.0.0
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/includes
 */

/**
 * The core plugin class.
 *
 * This is used to define internationalization, admin-specific hooks, and
 * public-facing site hooks.
 *
 * Also maintains the unique identifier of this plugin as well as the current
 * version of the plugin.
 *
 * @since      1.0.0
 * @package    Marketo_forms
 * @subpackage Marketo_forms/includes
 * @author     HyperX Media <sarmstrong@hyperxmedia.com>
 */
class Marketo_forms {

	/**
	 * The loader that's responsible for maintaining and registering all hooks that power
	 * the plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      Marketo_forms_Loader    $loader    Maintains and registers all hooks for the plugin.
	 */
	protected $loader;

	/**
	 * The unique identifier of this plugin.
	 *
	 * @since    1.0.0
	 * @access   protected
	 * @var      string    $plugin_name    The string used to uniquely identify this plugin.
	 */
	protected $plugin_name;

	/**
	 * The current version of the plugin.
	 *
	 * @since    1.0.1
	 * @access   protected
	 * @var      string    $version    The current version of the plugin.
	 */
	protected $version;

	/**
	 * Define the core functionality of the plugin.
	 *
	 * Set the plugin name and the plugin version that can be used throughout the plugin.
	 * Load the dependencies, define the locale, and set the hooks for the admin area and
	 * the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function __construct() {

		$this->plugin_name = 'ult_marketo_forms';
		$this->version = '1.0.1';

		if(is_admin() === true && isset($_GET['page']) && $_GET['page']=='ult_marketo_forms') $this->check_db_upgrade();
		$this->load_dependencies();
		$this->set_locale();
		$this->define_admin_hooks();
		$this->define_public_hooks();

	}

	/**
	 * Load the required dependencies for this plugin.
	 *
	 * Include the following files that make up the plugin:
	 *
	 * - Marketo_forms_Loader. Orchestrates the hooks of the plugin.
	 * - Marketo_forms_i18n. Defines internationalization functionality.
	 * - Marketo_forms_Admin. Defines all hooks for the admin area.
	 * - Marketo_forms_Public. Defines all hooks for the public side of the site.
	 *
	 * Create an instance of the loader which will be used to register the hooks
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function load_dependencies() {

		/**
		 * The class responsible for orchestrating the actions and filters of the
		 * core plugin.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-ult_marketo_forms-loader.php';

		/**
		 * The class responsible for defining internationalization functionality
		 * of the plugin.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'includes/class-ult_marketo_forms-i18n.php';

		/**
		 * The class responsible for defining all actions that occur in the admin area.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'admin/class-ult_marketo_forms-admin.php';

		/**
		 * The class responsible for defining all actions that occur in the public-facing
		 * side of the site.
		 */
		require_once plugin_dir_path( dirname( __FILE__ ) ) . 'public/class-ult_marketo_forms-public.php';

		$this->loader = new Marketo_forms_Loader();

	}

	/**
	 * Define the locale for this plugin for internationalization.
	 *
	 * Uses the Marketo_forms_i18n class in order to set the domain and to register the hook
	 * with WordPress.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function set_locale() {

		$plugin_i18n = new Marketo_forms_i18n();

		$this->loader->add_action( 'plugins_loaded', $plugin_i18n, 'load_plugin_textdomain' );

	}

	/**
	 * Register all of the hooks related to the admin area functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_admin_hooks() {
		$plugin_admin = new Marketo_forms_Admin( $this->get_plugin_name(), $this->get_version() );

		// Only load when in the plugin
		if(isset($_GET['page']) && $_GET['page']=='ult_marketo_forms'){
			$this->loader->add_action('admin_enqueue_scripts', $plugin_admin, 'enqueue_styles');
			$this->loader->add_action('admin_enqueue_scripts', $plugin_admin, 'enqueue_scripts');
		}


		// Handle AJAX for admin
		if(is_admin() === true){
			$this->loader->add_action('wp_ajax_mrkto_get_form', $plugin_admin, 'ajax_mrkto_get_form');
			$this->loader->add_action('wp_ajax_mrkto_save_data', $plugin_admin, 'ajax_mrkto_save_data');
			$this->loader->add_action('wp_ajax_mrkto_save_ty_data', $plugin_admin, 'ajax_mrkto_save_ty_data');
			$this->loader->add_action('wp_ajax_mrkto_get_style', $plugin_admin, 'ajax_mrkto_get_style');
			$this->loader->add_action('wp_ajax_mrkto_save_style', $plugin_admin, 'ajax_mrkto_save_style');
			$this->loader->add_action('wp_ajax_mrkto_remove_style', $plugin_admin, 'ajax_mrkto_remove_style');
			$this->loader->add_action('wp_ajax_mrkto_unlock_token', $plugin_admin, 'ajax_mrkto_unlock_token');
			$this->loader->add_action('wp_ajax_mrkto_save_js_form', $plugin_admin, 'ajax_mrkto_save_js_form');

		}

		// Form Hooks
		$this->loader->add_action('admin_init', $plugin_admin, 'save_api');

		// Show admin page
		$this->loader->add_action('admin_menu', $plugin_admin, 'display_admin_page');








	}

	/**
	 * Register all of the hooks related to the public-facing functionality
	 * of the plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 */
	private function define_public_hooks() {

		$plugin_public = new Marketo_forms_Public( $this->get_plugin_name(), $this->get_version() );


		// Handle AJAX request from font end form
		$this->loader->add_action( 'wp_ajax_mrkto_check_lead', $plugin_public, 'ajax_check_mrkto_lead' );
		$this->loader->add_action( 'wp_ajax_nopriv_mrkto_check_lead', $plugin_public, 'ajax_check_mrkto_lead' );



		// JS/CSS
		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_styles' );
		$this->loader->add_action( 'wp_enqueue_scripts', $plugin_public, 'enqueue_scripts' );


		// Register any shortcodes
		$this->loader->add_action( 'init', $plugin_public, 'register_shortcodes' );




		// plugin_dir_url( __FILE__ ) ex: http://wordpress:8888/wp-content/plugins/ult_marketo_forms/admin/partials/

	}

	/**
	 * Run the loader to execute all of the hooks with WordPress.
	 *
	 * @since    1.0.0
	 */
	public function run() {
		$this->loader->run();
	}

	/**
	 * The name of the plugin used to uniquely identify it within the context of
	 * WordPress and to define internationalization functionality.
	 *
	 * @since     1.0.0
	 * @return    string    The name of the plugin.
	 */
	public function get_plugin_name() {
		return $this->plugin_name;
	}

	/**
	 * The reference to the class that orchestrates the hooks with the plugin.
	 *
	 * @since     1.0.0
	 * @return    Marketo_forms_Loader    Orchestrates the hooks of the plugin.
	 */
	public function get_loader() {
		return $this->loader;
	}

	/**
	 * Retrieve the version number of the plugin.
	 *
	 * @since     1.0.0
	 * @return    string    The version number of the plugin.
	 */
	public function get_version() {
		return $this->version;
	}







	/**
	 * Upgrade DB if needed
	 *
	 * @since 1.0.0
	 * @return	n/a
	 */
	public function check_db_upgrade(){
		global $wpdb, $mylog, $cur_version;

		if ( version_compare( get_option( "ult_marketo_forms_db_version" ), $cur_version, '<' ) ) {

			// Create tables in db
			$charset_collate = $wpdb->get_charset_collate();

			$table_name = $wpdb->prefix . "ult_marketo_forms";
			$sql = "CREATE TABLE $table_name (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`form_name` varchar(255) DEFAULT NULL,
				`form_id` int(11) DEFAULT NULL,
				`settings` longtext,
				`status` varchar(20) DEFAULT NULL,
				`data_options` longtext,
				`ty_options` longtext,
		 		`style_id` int(11) DEFAULT 0,
		 		`host_link` varchar(255) DEFAULT NULL,
				`js_options` longtext,
				PRIMARY KEY (`id`)
			) $charset_collate;";

			$table_name = $wpdb->prefix . "ult_marketo_forms_styles";
			$sql.= "CREATE TABLE $table_name (
				`id` int(11) NOT NULL AUTO_INCREMENT,
				`style_name` varchar(100) DEFAULT NULL,
				`style` text,
				PRIMARY KEY (`id`)
			) $charset_collate;";


			require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
			dbDelta($sql);


			// Check if record exists
			$row = $wpdb->get_row("SELECT id FROM ".$wpdb->prefix."ult_marketo_forms_styles WHERE id = -1");
			if(!isset($row->id)){
				$rows = $wpdb->insert($wpdb->prefix."ult_marketo_forms_styles", array(
					'id' => '-1',
					'style_name' => 'Clean Style',
					'style' => "/* Override Layout */\r\n\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoForm * {\r\n	box-sizing: border-box;\r\n	padding:0px;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoRequiredField .mktoAsterix,\r\n.umfwrap .mktoForm .mktoAsterix,\r\n.umfwrap .mktoForm .mktoClear,\r\n.umfwrap .mktoForm .mktoGutter,\r\n.umfwrap .mktoForm .mktoOffset,\r\n.umfwrap .mktoForm .mktoFormRow.hidden {\r\n	display: none;\r\n}\r\n\r\n.umfwrap .mktoHasWidth {\r\n	width: 100% !important;\r\n}\r\n\r\n.umfwrap .mktoButtonRow,\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoFormCol,\r\n.umfwrap .mktoField\r\n.umfwrap .mktoFieldWrap {\r\n	width: 100%;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoFieldWrap {\r\n	float: none;\r\n}\r\n\r\n.umfwrap .mktoFormCol {\r\n	margin-bottom: 1em !important;\r\n}\r\n\r\n/* Two Column Rows */\r\n.umfwrap .mktoForm .mktoFormRow {\r\n	display: flex;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-child(2){\r\n	margin-left: 10px;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-last-child(3) {\r\n	margin-right: 10px;\r\n}\r\n\r\n/* Label */\r\n\r\n.umfwrap .mktoForm label.mktoLabel,\r\n .umfwrap .mktoForm .mktoRequiredField label.mktoLabel {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	margin-bottom: 5px;\r\n	padding-top: 0;\r\n	font-size: 1em;\r\n}\r\n\r\n/* Inputs */\r\n\r\n.umfwrap .mktoForm input,\r\n.umfwrap .mktoForm input[type=text],\r\n.umfwrap .mktoForm input[type=url],\r\n.umfwrap .mktoForm input[type=email],\r\n.umfwrap .mktoForm input[type=tel],\r\n.umfwrap .mktoForm input[type=number],\r\n.umfwrap .mktoForm input[type=date],\r\n.umfwrap .mktoForm textarea.mktoField,\r\n.umfwrap .mktoForm select.mktoField {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	height: auto;\r\n	padding: 8px 8px;\r\n	color: #333;\r\n	background-color: white;\r\n	border: 1px solid #ccc;\r\n}\r\n\r\n.umfwrap .mktoForm select.mktoField {\r\n	height: 33px;\r\n}\r\n\r\n\r\n/* Submit Button */\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap {\r\n	margin-left: 0px !important;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	background-image: none;\r\n	color: #fff;\r\n	background-color: #0A95B7;\r\n	font-size: 1em;\r\n	border: none;\r\n	padding: 11px 24px 9px 24px;\r\n	text-transform: uppercase;\r\n}\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton:hover {\r\n	background-color: #16819e;\r\n}"
				));
			}

			// Add version for future changes
			update_option('ult_marketo_forms_db_version', $cur_version);

			$mylog.= "db upgraded to version $cur_version\r\n";
		} else $mylog.= "db upgrade not needed\r\n";
	}

}
