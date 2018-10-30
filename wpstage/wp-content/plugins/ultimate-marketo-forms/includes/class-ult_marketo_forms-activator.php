<?php

/**
 * Fired during plugin activation
 *
 * @link       http://hyperxmedia.com
 * @since      1.0.0
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/includes
 */

/**
 * Fired during plugin activation.
 *
 * This class defines all code necessary to run during the plugin's activation.
 *
 * @since      1.0.0
 * @package    Marketo_forms
 * @subpackage Marketo_forms/includes
 * @author     HyperX Media <sarmstrong@hyperxmedia.com>
 */
class Marketo_forms_Activator {
	/**
	 * Short Description. (use period)
	 *
	 * Long Description.
	 *
	 * @since    1.0.0
	 */
	public static function activate() {
		global $wpdb, $cur_version;

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

		require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
		dbDelta( $sql );


		// Check if record exists
		$row = $wpdb->get_row("SELECT id FROM ".$wpdb->prefix."ult_marketo_forms_styles WHERE id = -1");
		if(!isset($row->id)){
			$rows = $wpdb->insert($wpdb->prefix."ult_marketo_forms_styles", array(
				'id' => '-1',
				'style_name' => 'Clean Style',
				'style' => "/* Override Layout */\r\n\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoForm * {\r\n	box-sizing: border-box;\r\n	padding:0px;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoRequiredField .mktoAsterix,\r\n.umfwrap .mktoForm .mktoAsterix,\r\n.umfwrap .mktoForm .mktoClear,\r\n.umfwrap .mktoForm .mktoGutter,\r\n.umfwrap .mktoForm .mktoOffset,\r\n.umfwrap .mktoForm .mktoFormRow.hidden {\r\n	display: none;\r\n}\r\n\r\n.umfwrap .mktoHasWidth {\r\n	width: 100% !important;\r\n}\r\n\r\n.umfwrap .mktoButtonRow,\r\n.umfwrap .mktoForm,\r\n.umfwrap .mktoFormCol,\r\n.umfwrap .mktoField\r\n.umfwrap .mktoFieldWrap {\r\n	width: 100%;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoFieldWrap {\r\n	float: none;\r\n}\r\n\r\n.umfwrap .mktoFormCol {\r\n	margin-bottom: 1em !important;\r\n}\r\n\r\n/* Two Column Rows */\r\n.umfwrap .mktoForm .mktoFormRow {\r\n	display: flex;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-child(2){\r\n	margin-left: 10px;\r\n}\r\n\r\n.umfwrap .mktoFormCol:nth-last-child(3) {\r\n	margin-right: 10px;\r\n}\r\n\r\n/* Label */\r\n\r\n.umfwrap .mktoForm label {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	margin-bottom: 5px;\r\n	padding-top: 0;\r\n	font-size: 1em;\r\n}\r\n\r\n/* Inputs */\r\n\r\n.umfwrap .mktoForm input,\r\n.umfwrap .mktoForm input[type=text],\r\n.umfwrap .mktoForm input[type=url],\r\n.umfwrap .mktoForm input[type=email],\r\n.umfwrap .mktoForm input[type=tel],\r\n.umfwrap .mktoForm input[type=number],\r\n.umfwrap .mktoForm input[type=date],\r\n.umfwrap .mktoForm textarea.mktoField,\r\n.umfwrap .mktoForm select.mktoField {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	font-size: 1em;\r\n	height: auto;\r\n	padding: 8px 8px;\r\n	color: #333;\r\n	background-color: white;\r\n	border: 1px solid #ccc;\r\n}\r\n\r\n.umfwrap .mktoForm select.mktoField {\r\n	height: 33px;\r\n}\r\n\r\n\r\n/* Submit Button */\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap {\r\n	margin-left: 0px !important;\r\n}\r\n\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton {\r\n	font-family: Helvetica, Arial, sans-serif;\r\n	background-image: none;\r\n	color: #fff;\r\n	background-color: #0A95B7;\r\n	font-size: 1em;\r\n	border: none;\r\n	padding: 11px 24px 9px 24px;\r\n	text-transform: uppercase;\r\n}\r\n.umfwrap .mktoForm .mktoButtonRow .mktoButtonWrap button.mktoButton:hover {\r\n	background-color: #16819e;\r\n}"
			));
		}


		// Add version for future changes
		update_option( 'ult_marketo_forms_db_version', $cur_version );
	}




}
