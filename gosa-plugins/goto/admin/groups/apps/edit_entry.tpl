
{if $type == "FOLDER"}
<h3>{$entry.NAME}</h3>

<table summary="{t}Edit application image{/t}" >
	<tr>
		<td>
			{t}Folder image{/t}
		</td>
		<td>
			{if $image_set}
				<img src="getbin.php?{$rand}" alt='{t}Could not load image.{/t}'>
			{else}
				<i>{t}None{/t}</i>
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan=2>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>{t}Upload image{/t}
		</td>
		<td>
			<input type="FILE" name="folder_image">
			<button type='submit' name='folder_image_upload'>{t}Upload{/t}</button>

		</td>
	</tr>
	<tr>
		<td>{t}Reset image{/t}</td>
		<td><button type='submit' name='edit_reset_image'>{t}Reset{/t}</button>
</td>
	</tr>
	<tr>
		<td>{t}Specify a path to an icon or an XDG icon specification filename instead{/t}
	</tr>
	<tr>
		<td>
		<input type="hidden" name="icon_path_submitted" value="1">
		<input name="use_icon_path" onChange="document.mainform.submit()" type="checkbox" {$use_icon_path}>
		{t}Filename{/t}
		<input name="icon_path" type="text" size=20 {if !$use_icon_path}disabled{/if} value="{$icon_path}">
    </td>
	</table>
<br>
{/if}

{if $type == "ENTRY"}
<h3>{t}Application settings{/t}</h3>
<table summary="{t}Edit application settings{/t}">
	<tr>
		<td>{t}Name{/t}</td>
		<td>{$entry.NAME}</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<b>{t}Application options{/t}</b>
		</td>
	</tr>
{foreach from=$paras item=item key=key}
	<tr>
		<td>{$key}&nbsp;</td>
		<td><input style='width:200px;' type='text' name="parameter_{$key}" value="{$item}"></td>
	</tr>
{/foreach}
</table>
{/if}

<hr>
{render acl=$placeOnDesktopACL}
      <input type=checkbox name="placeOnDesktop" value="1" {$placeOnDesktop}>
{/render}
      {t}Place icon on members desktop{/t}
      <br>
{render acl=$placeInStartmenuACL}
      <input type=checkbox name="placeInStartmenu" value="1" {$placeInStartmenu}>
{/render}
      {t}Place entry in members startmenu{/t}
      <br>
{render acl=$placeOnKickerACL}
      <input type=checkbox name="placeOnKicker" value="1" {$placeOnKicker}>
{/render}
      {t}Place entry in members launch bar{/t}

<p class="seperator">
</p>
<div style="width:100%; text-align:right; padding:3px;">
	<button type='submit' name='app_entry_save'>{msgPool type=saveButton}</button>

	&nbsp;
	<button type='submit' name='app_entry_cancel'>{msgPool type=cancelButton}</button>

</div>
