<?php defined('IN_IA') or exit('Access Denied');?><div class="form-group"></div>
<div class="form-group">
    <label class="col-sm-2 form-control-static">作品详情</label>
    <div class="col-sm-11">
        <?php if( ce('case.product' ,$item) ) { ?>
        <?php  echo tpl_ueditor('content',$item['content'],array('height'=>'300'))?>
        <?php  } else { ?>
        <textarea id='detail' style='display:none'><?php  echo $item['content'];?></textarea>
        <a href='javascript:preview_html("#detail")' class="btn btn-default">查看内容</a>
        <?php  } ?>
    </div>
</div>
<br>
