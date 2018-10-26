<div>CSS (add overwriting styles here)</div>
<div><textarea name="form_style" id="form_style" style="width:100%; height:200px;"><?php if(isset($style->style)) echo esc_textarea($style->style);?></textarea></div>
<div class="style_name">
	<?php echo (isset($style->id))?'Rename Style':'Save as a New Style';?>: <input type="text" name="style_name" id="style_name" value="<?php if(isset($style->style_name)) echo esc_attr($style->style_name);?>" placeholder="Style Name">
</div>