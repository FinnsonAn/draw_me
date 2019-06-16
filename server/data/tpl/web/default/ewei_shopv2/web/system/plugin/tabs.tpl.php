<?php defined('IN_IA') or exit('Access Denied');?><div class='menu-header'>应用管理</div>
<ul>
    <li <?php  if($_W['action']=='system.plugin') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin')?>">应用信息</a></li>
    <li <?php  if($_W['action']=='system.plugin.coms') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/coms')?>">组件信息</a></li>
    <li <?php  if($_W['action']=='system.plugin.perm') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/perm')?>">公众号权限</a></li>
</ul>
<?php  $filename = "../addons/ewei_shopv2/core/model/grant.php"; ?>
<?php  if(file_exists($filename)) { ?>
<div class='menu-header'>授权应用管理</div>
<ul>
    <li <?php  if($_W['action']=='system.plugin.adv') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/adv')?>">幻灯片管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.manage') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/manage')?>">应用管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.package') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/package')?>">应该套餐管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.code') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/code')?>">邀请码管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.sale') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/sale')?>">销售记录</a></li>
    <li <?php  if($_W['action']=='system.plugin.grant') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/grant')?>">授权管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.setting') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/setting')?>">应用管理设置</a></li>

</ul>
<?php  } ?>
<?php  if(p("grant")) { ?>
<div class='menu-header'>应用授权管理</div>
<ul>
    <li <?php  if($_W['action']=='system.plugin.pluginadv') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/pluginadv')?>">幻灯片管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.pluginmanage') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/pluginmanage')?>">授权应用管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.pluginpackage') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/pluginpackage')?>">授权套餐管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.pluginsale') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/pluginsale')?>">销售记录</a></li>
    <li <?php  if($_W['action']=='system.plugin.plugingrant') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/plugingrant')?>">系统授权管理</a></li>
    <li <?php  if($_W['action']=='system.plugin.pluginsetting') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/pluginsetting')?>">授权管理设置</a></li>
</ul>
<?php  } ?>
<?php  if(p("grant")) { ?>
<?php  } else { ?>
<div class='menu-header'>更多应用</div>
<ul>
    <li <?php  if($_W['action']=='system.plugin.apps') { ?>class='active'<?php  } ?>><a href="<?php  echo webUrl('system/plugin/apps')?>">应用中心</a></li>
</ul>
<?php  } ?>