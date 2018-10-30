<h2>"<?php echo esc_html($form->forms_list[0]->name);?>" Form</h2>

<div id="poststuff">
	<div id="post-body" class="metabox-holder">
		<div id="post-body-content">

			<div class="postbox">

				<h2>Capture Hidden Fields</h2>

				<div class="inside">
					<div class="area_box">
						<p class="settings_desc">Capture values from the URL or manually and add them to the Marketo form in a hidden field to be passed to Marketo when the form submits.</p>

						<form action="" method="post" enctype="multipart/form-data" id="form_hidden_fields">
							<table id="hidden_fields_table" class="form-data-table wp-list-table widefat striped">
								<thead>
									<tr>
										<th width="20%">Variable Location</th>
										<th width="45%">URL Variable Name</th>
										<th width="30%">Marketo Field</th>
										<th width="5%"></th>
									</tr>
								</thead>
								<tbody>
								<?php
								$hf_items = json_decode($db_form[0]->data_options);
								for($i=0; $i < count($hf_items->location); $i++){ ?>
									<tr>
										<td><select name="location[]" class="hf_location">
												<option value="url"<?php if($hf_items->location[$i]=='url'){ ?> selected<?php } ?>>From URL</option>
												<option value="manual"<?php if($hf_items->location[$i]=='manual'){ ?> selected<?php } ?>>Manual</option>
												<!--<option value="css_data"<?php if($hf_items->location[$i]=='css_data'){ ?> selected<?php } ?>>CSS Attr</option>-->
											</select>
										<td><input type="text" name="var_name[]" class="hf_var_name" value="<?php echo esc_attr($hf_items->var_name[$i]);?>" placeholder="URL Variable" style=""></td>
										<td><select name="mrkto_field[]">
												<?php foreach($fields_list as $key=>$label){ ?>
												<option value="<?php echo $key;?>"<?php if($hf_items->mrkto_field[$i]==$key){ ?> selected<?php } ?>><?php echo $label;?></option>
												<?php } ?>
											</select></td>
										<td style="width: 1px;"><a href="javascript:void(0);" class="remove_hf"><span class="dashicons dashicons-dismiss"></span></a></td>
									</tr>
								<?php } ?>

								<tr class="no_color">
									<td colspan="4"><a href="javascript:void(0)" class="add_hf_row"><span class="dashicons dashicons-plus"></span> Hidden Field</a></td>
								</tr>
								</tbody>
							</table>
							<input type="hidden" name="action" value="mrkto_save_data">
							<input type="hidden" name="form_id" value="<?php echo esc_attr($db_form[0]->id);?>">
							<div><br><input type="submit" name="submit" id="submit_hf" class="button button-primary" value="Save Changes"></div>
						</form>
					</div>
				</div>

			</div>


			<div class="postbox">

				<h2>Thank You Page</h2>

				<div class="inside">
					
					<div class="area_box">
						<p class="settings_desc">Send the user to a specific Thank You page based on conditions that are met.  Multiple sets of conditions can be used (each being seperated by the final 'Go to URL' statements).</p>

						<form action="" method="post" enctype="multipart/form-data" id="form_ty_option">
							<table id="thank_you_table" class="form-data-table wp-list-table widefat striped">
								<tbody>
								<?php
								$ty_items = json_decode($db_form[0]->ty_options);
								for($i=0; $i < count($ty_items->field); $i++){ ?>
									<tr<?php if($ty_items->field[$i]=='ty_url'){ ?> class="ty_row"<?php } ?>>
										<td style="width: 1px;"><span class="dashicons dashicons-sort"></span></td>
										<td><select name="field[]" class="ty_field" style="">
												<?php
												foreach($fields->forms_list as $item) {
													if($item->label > ''){ ?>
														<option value="<?php echo esc_attr($item->id);?>"<?php if($ty_items->field[$i] == $item->id){ ?> selected<?php } ?>>If '<?php echo esc_html($item->label);?>'</option>
													<?php }
												} ?>
												<option value="ty_url"<?php if($ty_items->field[$i]=='ty_url'){ ?> selected<?php } ?>>Go to URL</option>
											</select>
										<td>
											<select name="operation[]" class="operation_dd<?php if($ty_items->field[$i]=='ty_url'){ ?> hide<?php } ?>" style="">
												<option value="equals"<?php if($ty_items->operation[$i]=='equals'){ ?> selected<?php } ?>>Equals</option>
												<option value="greater"<?php if($ty_items->operation[$i]=='greater'){ ?> selected<?php } ?>>Greater than</option>
												<option value="less"<?php if($ty_items->operation[$i]=='less'){ ?> selected<?php } ?>>Less than</option>
												<option value="not_equal"<?php if($ty_items->operation[$i]=='not_equal'){ ?> selected<?php } ?>>Not equal to</option>
											</select>
											<input type="text" name="ty_url[]" class="ty_url_field<?php if($ty_items->field[$i]!='ty_url'){ ?> hide<?php } ?>" value="<?php echo esc_attr($ty_items->ty_url[$i]);?>" placeholder="Thank You URL">
										</td>
										<td><input type="text" name="value[]" class="ty_value<?php if($ty_items->field[$i]=='ty_url'){ ?> hide<?php } ?>" value="<?php echo esc_attr($ty_items->value[$i]);?>" placeholder="Value"></td>
										<td style="width: 1px;"><a href="javascript:void(0);" class="remove_ty"><span class="dashicons dashicons-dismiss"></span></a></td>
									</tr>
								<?php } ?>

								<tr class="no_color">
									<td colspan="4"><a href="javascript:void(0)" class="add_ty_row"><span class="dashicons dashicons-plus"></span> Rule/URL</a></td>
								</tr>
								</tbody>
							</table>
							<input type="hidden" name="action" value="mrkto_save_ty_data">
							<input type="hidden" name="form_id" value="<?php echo esc_attr($db_form[0]->id);?>">
							<div><br><input type="submit" name="submit" id="submit_ty" class="button button-primary" value="Save Changes"></div>
						</form>
					</div>




					<div class="hide" id="form_templates">
						<div id="template_hf_row">
							<table>
								<tbody>
									<tr>
										<td><select name="location[]" class="hf_location">
												<option value="url">From URL</option>
												<option value="manual">Manual</option>
												<!--<option value="css_data">CSS Data Attr</option>-->
											</select>
										<td><input type="text" name="var_name[]" value="" class="hf_var_name" placeholder="URL Variable" style=""></td>
										<td><select name="mrkto_field[]">
												<?php foreach($fields_list as $key=>$label){ ?>
													<option value="<?php echo $key;?>"<?php if($hf_items->mrkto_field[$i]==$key){ ?> selected<?php } ?>><?php echo $label;?></option>
												<?php } ?>
											</select></td>
										<td style="width: 1px;"><a href="javascript:void(0);" class="remove_hf"><span class="dashicons dashicons-dismiss"></span></a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="template_ty_row">
							<table>
								<tbody>
									<tr>
										<td style="width: 1px;"><span class="dashicons dashicons-sort"></span></td>
										<td><select name="field[]" class="ty_field" style="">
												<?php foreach($fields->forms_list as $item){
													if($item->label>''){ ?><option value="<?php echo esc_attr($item->id);?>">If '<?php echo esc_attr($item->label);?>'</option><?php }
												} ?>
												<option value="ty_url">Go to URL</option>
											</select>
										<td>
											<select name="operation[]" class="operation_dd<?php if($ty_items->field[$i]=='ty_url'){ ?> hide<?php } ?>" style="">
												<option value="equals">Equals</option>
												<option value="greater">Greater than</option>
												<option value="less">Less than</option>
												<option value="not_equal">Not equal to</option>
											</select>
											<input type="text" name="ty_url[]" class="ty_url_field hide" value="<?php echo esc_attr($ty_items->ty_url[$i]);?>" placeholder="Thank You URL">
										</td>
										<td><input type="text" name="value[]" class="ty_value" value="<?php esc_attr($ty_items->value[$i]);?>" placeholder="Value"></td>
										<td style="width: 1px;"><a href="javascript:void(0);" class="remove_ty"><span class="dashicons dashicons-dismiss"></span></a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>


				</div>

			</div>




			<div class="postbox">

				<h2>Form Style</h2>

				<div class="inside">

					<div class="area_box">
						<p class="settings_desc">Us the default style or create your own below.</p>

						<div id="form_styles_area">
							<form action="" method="post" enctype="multipart/form-data" id="form_styling">
								<p><select name="style_id" id="style_id" style="max-width:300px;">
										<option value="-2"<?php if($db_form[0]->style_id==-2){ ?> selected<?php } ?>>No Style</option>
										<?php foreach($styles as $style){ ?>
											<option value="<?php echo esc_attr($style->id);?>"<?php if($db_form[0]->style_id==$style->id){ ?> selected<?php } ?>><?php echo esc_attr($style->style_name);?></option>
										<?php } ?>
										<option value="0">+ Create Style</option>
									</select> <span id="remove_style_link"><a href="javascript:void(0)" style="color:#a00;">remove</a></span></p>
								<p id="create_style_area" class="hide">
									loading...
								</p>
								<p>
									<input type="hidden" name="action" value="mrkto_save_style">
									<input type="hidden" name="form_id" value="<?php echo esc_attr($db_form[0]->id);?>">
									<input type="submit" name="submit" id="submit_sty" class="button button-primary" value="Save Changes">
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>



			<div class="postbox">

				<h2>Javascript On Form Success</h2>

				<div class="inside">

					<div class="area_box">
						<p class="settings_desc">Add javascript that will be called after form submits and returns successfully.</p>

						<div id="form_styles_area">
							<form action="" method="post" enctype="multipart/form-data" id="form_js">
								<p><textarea name="js_form[success]" id="js_form_success" style="width:100%; height:250px;"><?php

										$example_html = "// EXAMPLES:\r\n\r\n";
										$example_html.= "// Get the form's jQuery element and hide it\r\n// form.getFormElem().hide();\r\n\r\n";
										$example_html.= "// Show thank you message (when thank you urls are not used)\r\n// jQuery('#mktoForm_".esc_attr($db_form[0]->id)."_ty').css('display', 'block');\r\n\r\n";
										$example_html.= "// Get form values\r\n// console.log(values);\r\n\r\n";
										$example_html.= "// Get form thank you page URL\r\n// console.log(followUpUrl);\r\n\r\n";


										if(isset($db_form[0]->js_options)){
											$js = json_decode($db_form[0]->js_options);
											if(isset($js->success) && $js->success>'') echo stripslashes($js->success);
											else echo $example_html;
										} else echo $example_html;
										?></textarea></p>

								<p>
									<input type="hidden" name="action" value="mrkto_save_js_form">
									<input type="hidden" name="form_id" value="<?php echo esc_attr($db_form[0]->id);?>">
									<input type="submit" name="submit" id="save_js_form" class="button button-primary" value="Save Changes">
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br class="clear">
</div>





<script>
	// Submit hidden field
	jQuery('#form_hidden_fields').submit(function(event){
		jQuery('#submit_hf').val('Saving...');
		jQuery.ajax({
			url:'<?php echo esc_url($ajax_url);?>',
			type:'post',
			data:jQuery('#form_hidden_fields').serialize()
		}).done(function(data){
			jQuery('#submit_hf').val('Saved');
			setTimeout(function(){
				jQuery('#submit_hf').val('Save Changes');
			},2000);
		});

		event.preventDefault();
		return false;
	});


	// Submit thank you option
	jQuery('#form_ty_option').submit(function(event){
		jQuery('#submit_ty').val('Saving...');
		jQuery.ajax({
			url:'<?php echo esc_url($ajax_url);?>',
			type:'post',
			data:jQuery('#form_ty_option').serialize()
		}).done(function(data){
			jQuery('#submit_ty').val('Saved');
			setTimeout(function(){
				jQuery('#submit_ty').val('Save Changes');
			},2000);
		});

		event.preventDefault();
		return false;
	});


	// Submit style
	jQuery('#form_styling').submit(function(event){
		jQuery('#submit_sty').val('Saving...');
		if( jQuery('#style_id').val() == 0 && jQuery('#style_name').val()==''){
			alert('Style Name is required for creating a new style');
			jQuery('#submit_sty').val('Save Changes');

		} else {
			jQuery.ajax({
				url: '<?php echo esc_url($ajax_url);?>',
				type: 'post',
				data: jQuery('#form_styling').serialize()
			}).done(function (data) {
				jQuery('#submit_sty').val('Saved');
				setTimeout(function () {
					//if( jQuery('#style_id').val() > -1)
					mrkto_show_form(<?php echo esc_html($form->forms_list[0]->id);?>);
					jQuery('#submit_sty').val('Save Changes');

				}, 2000);
			});
		}
		event.preventDefault();
		return false;
	});







	jQuery(document).on('click', '.remove_hf, .remove_ty', function(){
		jQuery(this).closest('tr').remove();
	});



	jQuery(document).on('change', '.ty_field', function(){
		if( jQuery(this).val() == 'ty_url') {
			jQuery(this).parent().parent().find('.operation_dd').hide();
			jQuery(this).parent().parent().find('.ty_url_field').removeClass('hide');
			jQuery(this).parent().parent().find('.ty_value').addClass('hide');
			jQuery(this).parent().parent().find('.operation_dd').addClass('hide');
			jQuery(this).closest('tr').addClass('ty_row');
		} else {
			jQuery(this).parent().parent().find('.operation_dd').show();
			jQuery(this).parent().parent().find('.ty_url_field').addClass('hide');
			jQuery(this).parent().parent().find('.ty_value').removeClass('hide');
			jQuery(this).parent().parent().find('.operation_dd').removeClass('hide');
			jQuery(this).closest('tr').removeClass('ty_row');
		}
	});



	jQuery('.add_hf_row').click(function(){
		jQuery('#hidden_fields_table tr:last').before( jQuery('#template_hf_row table tbody').html() );
	});

	jQuery('.add_ty_row').click(function(){
		jQuery('#thank_you_table tr:last').before( jQuery('#template_ty_row table tbody').html() );
	});


	jQuery('#style_id').change(function(){
		jQuery('#create_style_area').html('loading...');

		if( jQuery(this).val() == -1) jQuery('#remove_style_link').hide();
		else jQuery('#remove_style_link').show();

		if( jQuery(this).val() == -2) jQuery('#create_style_area').addClass('hide');
		else {
			jQuery('#create_style_area').removeClass('hide');
			jQuery('#create_style_area').load('<?php echo esc_url($ajax_url);?>', {
				'action': 'mrkto_get_style',
				'style_id': jQuery('#style_id').val()
			});
		}
	});


	jQuery(document).on('change', '.hf_location', function(){
		check_hidden_fields();
	});
	function check_hidden_fields(){
		jQuery('.hf_location').each(function(){
			if(jQuery(this).val()=='manual'){
				jQuery(this).parent().parent().find('.hf_var_name').prop('placeholder', 'Value');

			} else {
				jQuery(this).parent().parent().find('.hf_var_name').prop('placeholder', 'URL Variable');
			}
		});
	}


	jQuery( '#remove_style_link a' ).click(function(){
		if( confirm('Are you sure you want to remove this style?') ){
			var remove_id = jQuery('#style_id').val();
			jQuery.ajax({
				url: '<?php echo esc_url($ajax_url);?>',
				type: 'post',
				data: {
					style_id:remove_id,
					action:'mrkto_remove_style'
				}
			}).done(function (data) {
				jQuery("#style_id option[value='"+remove_id+"']").remove();
				jQuery('#create_style_area').html('');
				alert('Style removed');
			});
		}
	});



	jQuery('#save_js_form').click(function(e){
		jQuery('#save_js_form').val('Saving...');
		jQuery.ajax({
			url: '<?php echo esc_url($ajax_url);?>',
			type: 'post',
			data: jQuery('#form_js').serializeArray()
		}).done(function (data) {
			jQuery('#save_js_form').val('Saved');
			setTimeout(function(){
				jQuery('#save_js_form').val('Save Changes');
			}, 2000);
		});

		e.preventDefault();
		return false;
	})


	jQuery( function() {
		jQuery( "#thank_you_table tbody" ).sortable();

		if(jQuery('#style_id').val()>=-1) {
			jQuery('#create_style_area').removeClass('hide');
			jQuery('#create_style_area').load('<?php echo esc_url($ajax_url);?>', {
				'action': 'mrkto_get_style',
				'style_id': jQuery('#style_id').val()
			});
		}



		if(jQuery('#style_id').val()==-1) jQuery('#remove_style_link').hide();

		check_hidden_fields();
	} );
</script>