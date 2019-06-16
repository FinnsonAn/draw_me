<?php defined('IN_IA') or exit('Access Denied');?><div class='menu-header'>作品或案例</div>
<ul>
    <?php if(cv('case.product')) { ?>
        <li <?php  if($_W['action']=='product') { ?>class="active"<?php  } ?>><a href="<?php  echo webUrl('case/product')?>">作品管理</a></li>
    <?php  } ?>
    <?php if(cv('case.category')) { ?>
        <li <?php  if($_W['action']=='category') { ?>class="active"<?php  } ?>><a href="<?php  echo webUrl('case/category')?>">分类管理</a></li>
    <?php  } ?>

</ul>
<div class='menu-header'>作者</div>
<ul>
    <?php if(cv('case.author')) { ?>
        <li <?php  if($_W['action']=='author') { ?>class="active"<?php  } ?>><a href="<?php  echo webUrl('case/author')?>">作者管理</a></li>
    <?php  } ?>
    <?php if(cv('case.aucate')) { ?>
        <li <?php  if($_W['action']=='aucate') { ?>class="active"<?php  } ?>><a href="<?php  echo webUrl('case/aucate')?>">作者分类</a></li>
    <?php  } ?>
</ul>
<?php if(cv('case.cover|case.notice|case.set')) { ?>
    <div class='menu-header'>设置</div>
    <ul>
        <?php if(cv('case.set' && $_W['merchid']==0)) { ?>
            <li <?php  if($_W['action']=='set') { ?>class="active"<?php  } ?>><a href="<?php  echo webUrl('case/set')?>">基础设置</a></li>
        <?php  } ?>
    </ul>
<?php  } ?>