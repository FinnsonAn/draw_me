<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('case.category.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('case/category/add')?>">添加新作品分类</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('case/category')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>作品分类 <small><?php  if(!empty($item['id'])) { ?>修改【<?php  echo $item['name'];?>】<?php  } ?></small></h2> 
</div>

    <form  <?php if( ce('case.category' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('case.category' ,$item) ) { ?>
                        	<input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                        <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">分类名称</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('case.category' ,$item) ) { ?>
                        	<input type="text" name="catename" class="form-control" value="<?php  echo $item['name'];?>" data-rule-required="true" />
                        <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['name'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">分类图片</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('case.category' ,$item) ) { ?>
	                        <?php  echo tpl_form_field_image('thumb', $item['thumb'])?>
	                        <span class="help-block">建议尺寸: 100*100，或正方型图片 </span>
                        <?php  } else { ?>
	                        <?php  if(!empty($item['thumb'])) { ?>
	                        <a href='<?php  echo tomedia($item['thumb'])?>' target='_blank'>
	                           <img src="<?php  echo tomedia($item['thumb'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
	                        </a>
	                        <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                        <label class="col-sm-2 control-label">是否首页推荐</label>
                        <div class="col-sm-9 col-xs-12">
                             <?php if( ce('case.goods' ,$item) ) { ?>
	                            <label class="radio-inline">
	                                <input type="radio" name='isrecommand' value="0" <?php  if(empty($item['isrecommand'])) { ?>checked<?php  } ?> /> 否
	                            </label>
	                            <label class="radio-inline">
	                                <input type="radio" name='isrecommand' value="1" <?php  if($item['isrecommand']==1) { ?>checked<?php  } ?> /> 是
	                            </label>
                             <?php  } else { ?>
                             	<div class='form-control-static'><?php  if(empty($item['isrecommand'])) { ?>是<?php  } else { ?>否<?php  } ?></div>
                             <?php  } ?>
                        </div>
                    </div>
                
                <div class="form-group">
                    <label class="col-sm-2 control-label">是否显示</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('case.category' ,$item) ) { ?>
                            <label class='radio-inline'>
                                <input type='radio' name='enabled' value=0' <?php  if($item['enabled']==0) { ?>checked<?php  } ?> /> 否
                            </label>
	                        <label class='radio-inline'>
	                            <input type='radio' name='enabled' value=1' <?php  if($item['enabled']==1) { ?>checked<?php  } ?> /> 是
	                        </label>
                        <?php  } else { ?>
                        	<div class='form-control-static'><?php  if(empty($item['enabled'])) { ?>否<?php  } else { ?>是<?php  } ?></div>
                        <?php  } ?>
                    </div>
                </div>

                <div class="form-group"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('case.category' ,$item) ) { ?>
                            <input type="submit" value="提交" class="btn btn-primary"  />
                        <?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('case.category.add|case.category.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
                </div>

 

    </form>
 
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>
