<?php

/**
 * The public-facing functionality of the plugin.
 *
 * @link       http://hyperxmedia.com
 * @since      1.0.0
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/public
 */

/**
 * The public-facing functionality of the plugin.
 *
 * Defines the plugin name, version, and two examples hooks for how to
 * enqueue the admin-specific stylesheet and JavaScript.
 *
 * @package    Marketo_forms
 * @subpackage Marketo_forms/public
 * @author     HyperX Media <sarmstrong@hyperxmedia.com>
 */
class Marketo_forms_Public {

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
	 * @param      string    $plugin_name       The name of the plugin.
	 * @param      string    $version    The version of this plugin.
	 */
	public function __construct( $plugin_name, $version ) {

		$this->plugin_name = $plugin_name;
		$this->version = $version;

	}

	/**
	 * Register the stylesheets for the public-facing side of the site.
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

		wp_enqueue_style( $this->plugin_name, plugin_dir_url( __FILE__ ) . 'css/ult_marketo_forms-public.css', array(), $this->version, 'all' );

	}

	/**
	 * Register the JavaScript for the public-facing side of the site.
	 *
	 * @since    1.0.0
	 */
	public function enqueue_scripts() {

		wp_enqueue_script( 'mrktofrms-1', plugin_dir_url( __FILE__ ) . 'js/forms2.min.js', array( 'jquery' ), $this->version, false );
		wp_enqueue_script( 'mrktofrms-2', plugin_dir_url( __FILE__ ) . 'js/ult_marketo_forms-public.js', array( 'jquery' ), $this->version, false );
		wp_enqueue_script( 'mrktofrms-3', '//munchkin.marketo.net/munchkin.js', array( 'jquery' ), $this->version, false );
	}


	public function register_shortcodes(){
		add_shortcode( 'mrkto_frm', array( $this, 'mrkto_frm_func') );
	}



	public function mrkto_frm_func( $atts ) {
		global $wpdb;

		if( !is_numeric($atts['id']) ) die('marketo id needs to be a number');

		//$api_host = get_option('ult_marketo_forms_host');
		$plugin_path = admin_url( 'admin-ajax.php' );
		$db_form = $wpdb->get_row( 'SELECT * FROM '.$wpdb->prefix . 'ult_marketo_forms WHERE form_id = "'.esc_sql($atts['id']).'"');

		$style = "<style>
.mktoForm_ty_box { border:1px solid #0a0; background:#dfd; padding:10px 15px; color:#0a0; text-align:center; max-width:500px; display:none; }
";
		// Style
		if($db_form->style_id>=-1){
			$styling = $wpdb->get_row( 'SELECT * FROM '.$wpdb->prefix . 'ult_marketo_forms_styles WHERE id = "'.$db_form->style_id.'"');
			if(isset($styling->style)) $style.= esc_html($styling->style);
		}
		$style.= "</style>";

		$js_options = $url_vars = $ty_js = '';
		if(!empty($db_form)){
			// Hidden Fields
			if($db_form->data_options>''){
				$options = json_decode($db_form->data_options);
				for ($i = 0; $i < count($options->location); $i++) {
					if($options->location[$i] == 'url'){
						$field = esc_attr($options->mrkto_field[$i]);
						$js_options .= '<input type="hidden" name="' . $field . '" id="' . $field . '" value="">';
						$url_vars .= 'jQuery("#mktoForm_"+form_id+" #' . $field . '").val( get_url_var(\'' . esc_attr($options->var_name[$i]) . '\') );'."\r\n				";

					} else if($options->location[$i] == 'manual'){
						$field = esc_attr($options->mrkto_field[$i]);
						$js_options .= '<input type="hidden" name="' . $field . '" id="' . $field . '" value="'.esc_attr($options->var_name[$i]) .'">';
					}
				}
			}

			// Thank you page
			if($db_form->ty_options>''){
				$operations = array(
					'equals' => '==',
					'greater' => '>',
					'less' => '<',
					'not_equal' => '!='
				);
				$options = json_decode($db_form->ty_options);
				$checks = array();
				$cur_matching = true;
				for($i = 0; $i < count($options->field); $i++){
					if($options->field[$i] == 'ty_url'){
						if(count($checks)>0) $checks_html = "if(".implode(' && ', $checks).") ";
						else $checks_html = 'if(true)';

						if($cur_matching){
							$ty_js.= "					".$checks_html."{ window.location = '".esc_html($options->ty_url[$i])."'; return false; }\r\n";
						}
						$checks = array();
						$cur_matching = true;
					} else {
						if(is_numeric($options->value[$i])) $val = $options->value[$i];
						else $val = '"'.$options->value[$i].'"';
						$checks[] = 'values.'.$options->field[$i].' '.$operations[$options->operation[$i]].' '.$val;
					}
				}

				$ty_js.= '					if(followUpUrl>"" && followUpUrl.split(\'?\')[0]!=window.location.href.split(\'?\')[0]) window.location = followUpUrl;'."\r\n";
				$ty_js.= '					jQuery(\'#mktoForm_'.esc_html($atts['id']).' button[type=submit]\').html(\'Sent Successfully\');';
				$ty_js.= '					return false;';

			} else {
				$ty_js.= '					if(followUpUrl>"" && followUpUrl.split(\'?\')[0]!=window.location.href.split(\'?\')[0]) window.location = followUpUrl;'."\r\n";
				$ty_js.= '					jQuery(\'#mktoForm_'.esc_html($atts['id']).' button[type=submit]\').html(\'Sent Successfully\');';
				$ty_js.= '					return false;';
			}
		}

		$api_host = get_option('ult_marketo_forms_host');
		$account_id = str_replace(array('https://', 'http://'), '', $api_host);
		$account_id = explode('.', $account_id);
		$account_id = $account_id[0];




		// Vars for HTML
		$atts_id = esc_html($atts['id']);
		$host_link = esc_html($db_form->host_link);
		$account_id = esc_html($account_id);


		// Get JS for successful call
		$js = json_decode($db_form->js_options);
		$xtra_js = (isset($js->success))?stripslashes($js->success):'';



		// HTML For Form
		$html = <<<HTML
		<div class="umfwrap">
		<form id="mktoForm_{$atts_id}"></form>
		</div>
		<div id="mktoForm_{$atts_id}_ty" class="mktoForm_ty_box">Thank you! The information has been submitted successfully.</div>
		{$style} 
		<script>
			if(!plugin_path) var plugin_path = '{$plugin_path}';
			MktoForms2.loadForm("{$host_link}", "{$account_id}", {$atts_id}, function(form) {
				// Add an onSuccess handler
				form.onSuccess(function(values, followUpUrl) {					
					{$xtra_js}
					{$ty_js}
				});
			});
		</script>
		<div id="iframe_area"></div>



		<script>
			Munchkin.init('{$account_id}');
			
			function update_umrktofrm_{$atts_id}_fields(form_id){
				// update fields based on url vars
				jQuery("#mktoForm_"+form_id).append('{$js_options}');
				
				{$url_vars}
			}
		</script>
HTML;
		return $html;
	}


	private function getToken($api_host){
		$api_client_id = get_option('ult_marketo_forms_client_id');
		$api_client_secret = get_option('ult_marketo_forms_client_secret');

		if($api_host>'' && $api_client_id>'' && $api_client_secret>'') {
			$api_host_base = str_replace('/rest', '', $api_host);
			$ch = curl_init($api_host_base . "/identity/oauth/token?grant_type=client_credentials&client_id=" . $api_client_id . "&client_secret=" . $api_client_secret);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
			$response = json_decode(curl_exec($ch));
			curl_close($ch);


			$data = new stdClass();
			if(isset($response->access_token)) {
				$data->status = 'success';
				$data->token = $response->access_token;
			} else {
				$data->status = 'failed';
				$data->reason = $response->error_description;
			}
		}
		return $data;
	}






	public function ajax_check_mrkto_lead() {
		$api_host = get_option('ult_marketo_forms_host');
		$api_token = $this->getToken($api_host);

		$filter_val = sanitize_text_field($_POST['filterValues']);
		$fields = urlencode(implode(',', $_POST['fields']));


		$url = $api_host.'/v1/leads.json?filterType=cookie&fields='.$fields.'&filterValues='.urlencode($filter_val).'&access_token='.$api_token->token;
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json'));
		$response = json_decode(curl_exec($ch));
		curl_close($ch);



		if(empty($response->result)) {
			echo json_encode(array(
				'status' => 'failed',
				'reason' => 'no lead found'
			));
		} else if(!isset($response->result[0])){
			echo json_encode(array(
				'status' => 'failed',
				'reason' => print_r($response, true)
			));
		} else {
			echo json_encode(array(
				'status' => 'success',
				'info' => $response->result[0]
			));
		}

		wp_die();
	}
}
