<?php defined('IN_IA') or exit('Access Denied');?><div class="form-group">
    <label class="col-sm-2 control-label">排序</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
            <input type='number' class='form-control' name='displayorder' value="<?php  echo $item['displayorder'];?>"/>
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label must">标题</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
            <input type='text' class='form-control' id="title" name='title' value="<?php  echo $item['title'];?>" id="title" data-rule-required='true' data-msg-required='请设置标题'/>
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo $item['title'];?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">副标题</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
            <input type='text' class='form-control' id="subtitle" name='subtitle' value="<?php  echo $item['subtitle'];?>" id="subtitle" />
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo $item['title'];?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">所属分类</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
        <select class='form-control' name='cate' data-rule-required='true' data-msg-required='请选择分类'>
            <option value=''>请选择商品分类</option>
            <?php  if(is_array($cates)) { foreach($cates as $cate) { ?>
                <option value='<?php  echo $cate['id'];?>' <?php  if($item['cate']==$cate['id']) { ?>selected<?php  } ?>><?php  echo $cate['name'];?></option>
            <?php  } } ?>
        </select>
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo $item['catename'];?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">属性</label>
    <div class="col-sm-9 col-xs-12" >
        <?php if( ce('case.product' ,$item) ) { ?>
        <label for="isrecommand" class="checkbox-inline">
            <input type="checkbox" name="isrecommand" value="1" id="isrecommand" <?php  if($item['isrecommand'] == 1) { ?>checked="true"<?php  } ?> /> 推荐
        </label>
        <label for="isnew" class="checkbox-inline">
            <input type="checkbox" name="isnew" value="1" id="isnew" <?php  if($item['isnew'] == 1) { ?>checked="true"<?php  } ?> /> 新作
        </label>
        <label for="ishot" class="checkbox-inline">
            <input type="checkbox" name="ishot" value="1" id="ishot" <?php  if($item['ishot'] == 1) { ?>checked="true"<?php  } ?> /> 热门
        </label>
        <?php  } else { ?> <div class='form-control-static'>
        <?php  if($item['isnew']==1) { ?>新作; <?php  } ?>
        <?php  if($item['ishot']==1) { ?>热门; <?php  } ?>
        <?php  if($item['isrecommand']==1) { ?>推荐; <?php  } ?>
    </div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label must">缩略图</label>
    <div class="col-sm-9 col-xs-12 thumb-container gimgs">
        <?php if( ce('case.product' ,$item) ) { ?>
            <?php  echo tpl_form_field_image('thumb',$item['thumb'])?>
        <?php  } else { ?>
            <?php  if(!empty($item['thumb'])) { ?>
                <a href='<?php  echo tomedia($item[' thumb'])?>' target='_blank'>
                    <img src="<?php  echo tomedia($item['thumb'])?>" style='width:100px;border:1px solid #ccc;padding:1px'/>
                </a>
            <?php  } ?>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label ">作品图片</label>
    <div class="col-sm-9 col-xs-12 gimgs">
        <?php if( ce('case.product' ,$item) ) { ?>
        <?php  echo tpl_form_field_multi_image('thumbs',$piclist)?>
        <span class="help-block image-block">可上传多张图片，并保持图片大小一致</span>
        <span class="help-block">您可以拖动图片改变其显示顺序 </span>
        <?php  } else { ?>
        <?php  if(is_array($piclist)) { foreach($piclist as $p) { ?>
        <a href='<?php  echo tomedia($p)?>' target='_blank'>
            <img src="<?php  echo tomedia($p)?>" style='height:100px;border:1px solid #ccc;padding:1px;float:left;margin-right:5px;' />
        </a>
        <?php  } } ?>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">作者id</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
            <input type='text' class='form-control' id="author" name='author' value="<?php  echo $item['author'];?>" id="author" placeholder="请输入作者ID"/>
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo $item['author'];?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">创建日期</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
            <?php echo tpl_form_field_date('date', !empty($item['date']) ? date('Y-m-d',$item['date']) : date('Y-m-d'),true)?>
        <?php  } else { ?>
            <div class='form-control-static'><?php  echo date('Y-m-d',$item['date'])?></div>
        <?php  } ?>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">简介</label>
    <?php if( ce('case.product' ,$item) ) { ?>
    <div class="col-sm-9 col-xs-12">
        <textarea name='desc' class="form-control"><?php  echo $item['desc'];?></textarea>
    </div>
    <?php  } else { ?>
        <div class='form-control-static'><?php  echo $item['desc'];?></div>
    <?php  } ?>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">状态</label>
    <div class="col-sm-9 col-xs-12">
        <?php if( ce('case.product' ,$item) ) { ?>
        <label class='radio-inline'>
            <input type='radio' name='enabled' value=1' <?php  if($item['enabled']==1) { ?>checked<?php  } ?> /> 显示
        </label>
        <label class='radio-inline'>
            <input type='radio' name='enabled' value=0' <?php  if($item['enabled']==0) { ?>checked<?php  } ?> /> 隐藏
        </label>
     	<?php  } else { ?>
            <div class='form-control-static'><?php  if(empty($item['enabled'])) { ?>隐藏<?php  } else { ?>显示<?php  } ?></div>
        <?php  } ?>
    </div>
</div>
