<?php

/**
 * The admin-specific functionality of the plugin.
 *
 * @link       http://hyperxmedia.com
 * @since      1.0.0
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/admin
 */

/**
 * The admin-specific functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/admin
 * @author     HyperX Media <sarmstrong@hyperxmedia.com>
 */
class Marketo_forms_Admin {

	/**
	 * The ID of this plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $plugin_name    The ID of this plugin.
	 */
	private $plugin_name;

	/**
	 * The version of this plugin.
	 *
	 * @since    1.0.0
	 * @access   private
	 * @var      string    $version    The current version of this plugin.
	 */
	private $version;

	/**
	 * Initialize the class and set its properties.
	 *
	 * @since    1.0.0
	 * @param      string    $plugin_name       The name of this plugin.
	 * @param      string    $version    The version of this plugin.
	 */
	public function __construct( $plugin_name, $version ) {

		$this->plugin_name = $plugin_name;
		$this->version = $version;


	}

	/**
	 * Register the stylesheets for the admin area.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_styles() {

		/**
		 * This function is provided for demonstration purposes only.
		 *
		 * An instance of this class should be passed to the run() function
		 * defined in Marketo_forms_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Marketo_forms_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_style( 'mrktofrms-1', plugin_dir_url( __FILE__ ) . 'css/ult_marketo_forms-admin.css', array(), $this->version, 'all' );
	}

	/**
	 * Register the JavaScript for the admin area.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {

		/**
		 * This function is provided for demonstration purposes only.
		 *
		 * An instance of this class should be passed to the run() function
		 * defined in Marketo_forms_Loader as all of the hooks are defined
		 * in that particular class.
		 *
		 * The Marketo_forms_Loader will then create the relationship
		 * between the defined hooks and the functions defined in this
		 * class.
		 */

		wp_enqueue_script('jquery-ui-core', false, array('jquery'));
		wp_enqueue_script('jquery-ui-sortable', false, array('jquery'));
		wp_enqueue_script('mrktofrms-admin', plugin_dir_url( __FILE__ ) . 'js/ult_marketo_forms-admin.js', array( 'jquery' ), $this->version, false );
		wp_enqueue_script('jquery-datatables', plugin_dir_url( __FILE__ ) . 'js/jquery.dataTables.min.js', array( 'jquery' ), $this->version, false );

	}


	public function display_admin_page(){
		add_menu_page(
			'Ultimate Marketo Forms',
			'Marketo Forms',
			'manage_options',
			'ult_marketo_forms',
			array($this, 'showPage'),
			'dashicons-editor-table'
		);
	}

	public function showPage(){
		global $mylog, $wpdb;

		// Only load when in the plugin
		if(isset($_GET['page']) && $_GET['page']=='ult_marketo_forms'){
			$dir = plugin_dir_path(__FILE__);
			$ajax_url = admin_url('admin-ajax.php');

			// Get API Token and host for subsequent calls
			$api_host = get_option('ult_marketo_forms_host');
			$api_token = $this->getToken($api_host);
			$mrkto_plugin_unlocked = get_option('ult_marketo_forms_unlocked');

			// Make any API calls if token good
			if(isset($api_token->status) && $api_token->status == 'success'){
				// Get Forms
				include $dir . 'api/Asset/Forms/GetForms.php';
				$forms = new GetForms();
				$form_list = $forms->getForms($api_host, $api_token->token);

				// Add to DB
				$db_form = $wpdb->get_results( 'SELECT id, form_id FROM '.$wpdb->prefix . 'ult_marketo_forms');
				$cur_forms = array();
				foreach($db_form as $item) $cur_forms[] = $item->form_id;

				foreach($form_list->forms_list as $item){
					if(!in_array($item->id, $cur_forms) && $item->id>0){
						$url = str_replace(array('https:', 'http:'), '', $item->url); // remove http(s)
						$url = explode('#', $url);	// get url before hash
						$url = substr($url[0], 0, -1);	// remove last slash
						$wpdb->insert($wpdb->prefix . 'ult_marketo_forms',
							array(
								'form_name' => $item->name,
								'form_id' => $item->id,
								'status' => $item->status,
								'host_link' => $url
							)
						);
					}
				}


				register_setting( 'marketo-forms-settings', 'ult_marketo_forms_client_secret' );
			}

			// Display Admin
			include $dir . 'partials/ult_marketo_forms-admin-display.php';
		}


	}




	public function get_forms(){
		global $wpdb;

		// Access Marketo API and fetch forms.  Compare and insert any non-existing.

		$table_name = $wpdb->prefix . 'ult_marketo_forms';
		$wpdb->insert(
			$table_name,
			array(
				'form_name' => 'form name here',
				'form_id' => '1234',
				'settings' => '',
			)
		);
	}




	public function save_api(){
		register_setting( 'marketo-forms-settings', 'ult_marketo_forms_host' );
		register_setting( 'marketo-forms-settings', 'ult_marketo_forms_client_id' );
		register_setting( 'marketo-forms-settings', 'ult_marketo_forms_client_secret' );
	}





	public function ajax_mrkto_get_form(){
		global $wpdb;


		$dir = plugin_dir_path(__FILE__);
		$mrkto_plugin_unlocked = get_option('ult_marketo_forms_unlocked');
		if($mrkto_plugin_unlocked==1){

			$ajax_url = admin_url('admin-ajax.php');

			// Get Forms
			$api_host = get_option('ult_marketo_forms_host');
			$api_token = $this->getToken($api_host);
			$form_id = intval(sanitize_text_field($_POST['form_id']));

			include $dir . 'api/Asset/Forms/GetForms.php';
			$forms = new GetForms();
			$form = $forms->getForm($api_host, $api_token->token, $form_id);
			$fields = $forms->getFormFields($api_host, $api_token->token, $form_id);


			$db_form = $wpdb->get_results('SELECT * FROM ' . $wpdb->prefix . 'ult_marketo_forms WHERE form_id = "' . $form->forms_list[0]->id . '"');
			if(empty($db_form)){
				$wpdb->insert($wpdb->prefix . 'ult_marketo_forms',
					array(
						'form_name' => $form->forms_list[0]->name,
						'form_id' => $form->forms_list[0]->id,
						'status' => $form->forms_list[0]->status,
					)
				);
				$db_form = $wpdb->get_results('SELECT * FROM ' . $wpdb->prefix . 'ult_marketo_forms WHERE form_id = "' . $form->forms_list[0]->id . '"');
			}


			// Style
			$styles = $wpdb->get_results('SELECT * FROM ' . $wpdb->prefix . 'ult_marketo_forms_styles ORDER BY style_name');


			// Get Marketo Fields
			$url = $api_host . "/v1/leads/describe.json?access_token=" . $api_token->token;
			$ch = curl_init($url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
			$response = curl_exec($ch);


			$fields_list = array();
			if(isset($response)){
				$json = json_decode($response);
				$temp_fields = $json->result;
				foreach ($temp_fields as $item) $fields_list[$item->rest->name] = $item->displayName;
				asort($fields_list);
			}




			include $dir . 'partials/ult_marketo_forms-form.php';
		} else {
			include $dir . 'partials/ult_marketo_forms-upgrade.php';
		}

		wp_die();
	}




	public function ajax_mrkto_save_data(){
		global $wpdb;

		$location_list = array();
		foreach($_POST['location'] as $item) $location_list[] = sanitize_text_field($item);

		$var_name_list = array();
		foreach($_POST['var_name'] as $item) $var_name_list[] = sanitize_text_field($item);

		$mrkto_field_list = array();
		foreach($_POST['mrkto_field'] as $item) $mrkto_field_list[] = sanitize_text_field($item);

		$data = array(
			'location' => $location_list,
			'var_name' => $var_name_list,
			'mrkto_field' => $mrkto_field_list
		);

		$form_id = intval(sanitize_text_field($_POST['form_id']));
		if($form_id){
			$wpdb->update($wpdb->prefix . 'ult_marketo_forms', array(
				'data_options' => json_encode($data)
			), array(
				'id'=>$form_id
			));
		}

		wp_die();
	}




	public function ajax_mrkto_save_ty_data(){
		global $wpdb;


		$field_list = array();
		foreach($_POST['field'] as $item) $field_list[] = sanitize_text_field($item);

		$operation_list = array();
		foreach($_POST['operation'] as $item) $operation_list[] = sanitize_text_field($item);

		$ty_url_list = array();
		foreach($_POST['ty_url'] as $item) $ty_url_list[] = sanitize_text_field($item);

		$value_list = array();
		foreach($_POST['value'] as $item) $value_list[] = sanitize_text_field($item);

		$data = array(
			'field' => $field_list,
			'operation' => $operation_list,
			'ty_url' => $ty_url_list,
			'value' => $value_list
		);

		$form_id = intval(sanitize_text_field($_POST['form_id']));
		if($form_id){
			$wpdb->update($wpdb->prefix . 'ult_marketo_forms', array(
				'ty_options' => json_encode($data)
			), array(
				'id' => $form_id
			));
		}
		wp_die();
	}




	public function ajax_mrkto_save_style(){
		global $wpdb;

		// Save Style
		$data = array(
			'style_name' => sanitize_text_field($_POST['style_name']),
			'style' => sanitize_textarea_field($_POST['form_style'])
		);

		if(isset($_POST['style_id'])) $style_id = intval(sanitize_text_field($_POST['style_id']));
		else $style_id = -1;

		if( !$style_id <> 0 ){
			$wpdb->insert($wpdb->prefix . 'ult_marketo_forms_styles', $data);
			$style_id = $wpdb->insert_id;

		} else if( $style_id > -2 ){
			$wpdb->update($wpdb->prefix . 'ult_marketo_forms_styles', $data, array(
				'id' => $style_id
			));
		}

		$form_id = intval(sanitize_text_field($_POST['form_id']));
		if($form_id){
			// Save to form
			$wpdb->update($wpdb->prefix . 'ult_marketo_forms', array(
				'style_id' => $style_id
			), array(
				'id' => $form_id
			));
		}
		wp_die();
	}




	public function ajax_mrkto_get_style(){
		global $wpdb;

		$style_id = intval(sanitize_text_field($_POST['style_id']));
		$sql = $wpdb->prepare('SELECT * FROM '.$wpdb->prefix . 'ult_marketo_forms_styles WHERE id = %d', array($style_id));
		$style = $wpdb->get_row( $sql );


		// Display Admin
		$dir = plugin_dir_path( __FILE__ );
		include $dir . 'partials/ult_marketo_forms-admin-style.php';
		wp_die();
	}



	public function ajax_mrkto_remove_style(){
		global $wpdb;

		$style_id = intval(sanitize_text_field($_POST['style_id']));

		$wpdb->delete($wpdb->prefix . 'ult_marketo_forms_styles', array('id'=>$style_id) );

		wp_die();
	}



	//
	public function ajax_mrkto_unlock_token(){
		global $wpdb;

		if(sanitize_text_field($_POST['results']['status']) == 'success'){
			update_option('ult_marketo_forms_unlocked', 1);

			echo json_encode(array(
				'status' => 'success',
				'message' => 'Plugin is now unlocked.  Thank you!'
			));

		} else {
			if(isset($_POST['results']['reason'])){
				echo json_encode(array(
					'status' => 'failed',
					'message' => sanitize_text_field($_POST['results']['reason'])
				));
			} else {
				echo json_encode(array(
					'status' => 'failed',
					'message' => 'Unknown error occorred.  Please try again.'
				));
			}
		}


		wp_die();
	}


	// Save javascript
	public function ajax_mrkto_save_js_form(){
		global $wpdb;

		$data = array();
		$data['success'] = sanitize_textarea_field($_POST['js_form']['success']);

		$form_id = intval(sanitize_text_field($_POST['form_id']));
		if($form_id){
			$wpdb->update($wpdb->prefix . 'ult_marketo_forms', array(
				'js_options' => json_encode($data)
			), array(
				'id'=>$form_id
			));
			echo $wpdb->last_query;
		}
		wp_die();
	}



	private function getToken($api_host){
		$api_client_id = get_option('ult_marketo_forms_client_id');
		$api_client_secret = get_option('ult_marketo_forms_client_secret');
		$data = new stdClass();

		if($api_host>'' && $api_client_id>'' && $api_client_secret>'') {
			$api_host_base = str_replace('/rest', '', $api_host);
			$ch = curl_init($api_host_base . "/identity/oauth/token?grant_type=client_credentials&client_id=" . $api_client_id . "&client_secret=" . $api_client_secret);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
			$response = json_decode(curl_exec($ch));
			curl_close($ch);


			if(isset($response->access_token)) {
				$data->status = 'success';
				$data->token = $response->access_token;
			} else {
				$data->status = 'failed';
				if(isset($response->error_description)) $data->reason = $response->error_description;
				else if(isset($response->errors[0]->message)) $data->reason = $response->errors[0]->message;
			}
		}
		return $data;
	}



}
