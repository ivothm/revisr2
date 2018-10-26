<div class="mrktofrms_content wrap">
	<h1>Ultimate Marketo Forms</h1>
	
	<div id="area_forms">
		<br>

		<div>
			<?php
			// check if forms recieved
			if(isset($form_list->status) && $form_list->status=='success'){
				if(count($form_list->forms_list)>0){ ?>
					 <table style="text-align:left" width="100%" class="datatables wp-list-table widefat fixed striped">
						<thead>
						<tr>
							<th>Form Name</th>
							<th align="center">Shortcode</th>
							<th align="center">Folder</th>
							<th align="center">Progressive</th>
							<th align="center">Status</th>
							<th align="center">Marketo Link</th>
						</tr>
						</thead>
						<tbody>
						<?php foreach($form_list->forms_list as $item){ ?>
							<tr>
								<td><strong><a href="javascript:void(0)" class="click_form" data-id="<?php echo esc_html($item->id);?>"><?php echo esc_html($item->name);?></a></strong></td>
								<td class="code">[mrkto_frm id="<?php echo esc_html($item->id);?>"]</td>
								<td><?php echo esc_html($item->folder->folderName);?></td>
								<td><?php echo ($item->progressiveProfiling==1)?'yes':'no';?></td>
								<td><?php echo esc_html($item->status);?></td>
								<td><a href="<?php echo esc_url($item->url); ?>" class="" target="_blank">View <span class="dashicons dashicons-external"></span></a></td>
							</tr>
						<?php } ?>
						</tbody>
					</table>

				<?php } else { ?>
					<div><br>No forms found</div>
				<?php } ?>
			<?php } else {  ?>
				<div><?=(isset($form_list->reason) && $form_list->reason>'')?esc_html($form_list->reason):'Enter your Marketo API settings below to view your forms.';?></div>

			<?php } ?>
		</div> 
	</div>


	<div id="area_form" class="hide">
		<div class="back2forms"><a href="javascript:void(0)" id="click_area_forms">&larr; Back to Forms List</a></div>
		<div id="area_edit_form">

		</div>
	</div>


	<div id="area_settings">
		<br>

		<table class="" width="100%">
			<tr>
				<td width="50%" valign="top">
					<h2>Marketo Account API Settings</h2>
					<p>Need help finding these values?  <a href="http://hyperxmedia.com/umf-registration/umf_api_settings.pdf" target="_blank">Click here</a> to see how to find/create these in Marketo.</p>
					<?php if(isset($api_token->status) && $api_token->status=='failed'){ ?>
						<p style="color:#a00;"><strong>Error connecting to API<?php if(isset($api_token->reason)) echo ' ('.esc_html($api_token->reason).')';?>.  Review API values below and update.</strong></p>
					<?php } ?>
					<form method="post" action="options.php">
						<?php settings_fields( 'marketo-forms-settings' ); ?>
						<?php do_settings_sections( 'marketo-forms-settings' ); ?>
						<table class="">
							<tr>
								<td align="right" scope="row"><span class="field_space_right">Endpoint:</span></td>
								<td><input type="text" name="ult_marketo_forms_host" value="<?php echo esc_attr(get_option( 'ult_marketo_forms_host' )); ?>" class="regular-text" /></td>
							</tr>
							<tr>
								<td align="right" scope="row"><span class="field_space_right">Client ID:</span></td>
								<td><input type="password" name="ult_marketo_forms_client_id" value="<?php echo esc_attr(get_option( 'ult_marketo_forms_client_id' )); ?>" class="regular-text" /></td>
							</tr>
							<tr>
								<td align="right" scope="row"><span class="field_space_right">Client Secret:</span></td>
								<td><input type="password" name="ult_marketo_forms_client_secret" value="<?php echo esc_attr(get_option( 'ult_marketo_forms_client_secret' )); ?>" class="regular-text" /></td>
							</tr>
						</table>

						<input type="hidden" name="area_id" id="area_id" value="api">
						<?php submit_button(); ?>
					</form>
				</td>
				<td width="50%" valign="top">
					<?php if(isset($mrkto_plugin_unlocked) && $mrkto_plugin_unlocked==1){ ?>
						<h2>Ultimate Marketo Forms pro version unlocked</h2>
					<?php } else { ?>
						<h2>Unlock Free Pro Version</h2>
						<p><a href="http://www.hyperxmedia.com/ultimate-marketo-forms-wordpress-plugin/" target="_blank">Click here</a> to view Pro features.  It's Free!  </p>
	
						<table class="">
							<tr>
								<td align="right" scope="row"><span class="field_space_right">Pro Version Token:</span></td>
								<td><input type="text" name="ult_marketo_forms_token" id="ult_marketo_forms_token" value="<?php echo esc_attr(get_option( 'ult_marketo_forms_token' )); ?>" class="regular-text" placeholder="paste token here" /></td>
							</tr>
						</table>
						<input type="hidden" name="action" id="action" value="mrkto_unlock_token">
						<input type="hidden" name="website" id="website" value="">
						<p class="submit"><input type="submit" name="submit" id="submit_token" class="button button-primary" value="Save Changes"></p>
					<?php } ?>
				</td>
			</tr>
		</table>
	</div>
</div>



<script>

	jQuery('.click_form').click(function(){
		var form_id = jQuery(this).data('id');
		mrkto_show_form(form_id);
	});


	function mrkto_show_form(form_id){
		jQuery('#area_settings, #area_forms, #area_form').addClass('hide');
		jQuery('#area_form').removeClass('hide');
		jQuery('#area_edit_form').html('<div>Loading...</div>');
		jQuery('#area_edit_form').load('<?php echo esc_url($ajax_url);?>', {
			form_id:form_id,
			action:'mrkto_get_form'
		}, function(){
			// show/hide tabs
		});
	}


	jQuery('#click_area_forms').click(function(){
		jQuery('#area_forms, #area_form').addClass('hide');
		jQuery('#area_forms, #area_settings').removeClass('hide');
	});

	jQuery('#click_area_settings').click(function(){
		jQuery('#area_settings, #area_forms, #area_form').addClass('hide');
		jQuery('#area_settings').removeClass('hide');
	});


	jQuery('.datatables').DataTable({
		stateSave: true,
		responsive: true,
		"language": {
			"paginate": {
				"previous": "‹",
				"next": "›",
			}
		}
	});


	jQuery('#submit_token').click(function(){
		console.log('submitted 1');
		jQuery.ajax({
			url: 'https://hyperxmedia.com/umf-registration/process.php',
			type: 'post',
			data: {
				action:'unlock',
				token:jQuery('#ult_marketo_forms_token').val(),
				website:jQuery('#website').val()
			}
		}).done(function (data) {
			console.log('submitted 2');
			console.log(data);
			jQuery.ajax({
				url: '<?php echo esc_url($ajax_url);?>',
				type: 'post',
				data: {
					action:'mrkto_unlock_token',
					results:jQuery.parseJSON(data)
				}
			}).done(function(e){
				console.log('submitted 3');
				console.log(e);
				var info = jQuery.parseJSON(e);
				alert(info.message);
				if(info.status == 'success') location.reload();
			});
		});
	});


	<?php if(isset($_GET['fid'])){ ?>mrkto_show_form(<?php esc_html($_GET['fid']);?>);<?php } ?>
</script>







<!-- LOG -->
<div class="mrktofrms_log"><?=$mylog;?></div>