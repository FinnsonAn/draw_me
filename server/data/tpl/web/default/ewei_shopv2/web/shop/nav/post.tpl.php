<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('shop.nav.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('shop/nav/add', array('group_id' => $group_id))?>">添加新导航</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('shop/nav')?>">返回列表</a>
               
	</span>
	<h2><?php  if(!empty($item['id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>导航 <small><?php  if(!empty($item['id'])) { ?>修改【<?php  echo $item['navname'];?>】<?php  } ?></small></h2> 
</div>
 
    <form <?php if( ce('shop.nav' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['id'];?>" />
 
                <div class="form-group">
                    <label class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('shop.nav' ,$item) ) { ?>
                                <input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                                <span class='help-block'>数字越大，排名越靠前</span>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">导航标题</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.nav' ,$item) ) { ?>
                        	<input type="text" id='navname' name="navname" class="form-control" value="<?php  echo $item['navname'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['navname'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">默认图标</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.nav' ,$item) ) { ?>
	                        <?php  echo tpl_form_field_image('icon', $item['icon'])?>
	                        <span class='help-block'>建议尺寸:100 * 100 , 请将所有导航图片尺寸保持一致</span>
                        <?php  } else { ?>
                            <?php  if(!empty($item['icon'])) { ?>
                                  <a href='<?php  echo tomedia($item['icon'])?>' target='_blank'>
                            		<img src="<?php  echo tomedia($item['icon'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
                                  </a>
                            <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">选中图标</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.nav' ,$item) ) { ?>
	                        <?php  echo tpl_form_field_image('active_icon', $item['active_icon'])?>
	                        <span class='help-block'>建议尺寸:100 * 100 , 请将所有导航图片尺寸保持一致</span>
                        <?php  } else { ?>
                            <?php  if(!empty($item['icon'])) { ?>
                                  <a href='<?php  echo tomedia($item['active_icon'])?>' target='_blank'>
                            		<img src="<?php  echo tomedia($item['active_icon'])?>" style='width:100px;border:1px solid #ccc;padding:1px' />
                                  </a>
                            <?php  } ?>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">所属导航组</label>
                    <div class="col-sm-9 col-xs-12">
                        <select class="form-control" name="group_id" id="group_id">
                            <option value="">请选择</option>
                            <?php  if(is_array($groups)) { foreach($groups as $v) { ?>
                            <option value="<?php  echo $v['gid'];?>"<?php  if($item['group_id']==$v['gid'] || $group_id==$v['gid']) { ?> selected=""<?php  } ?>><?php  echo $v['title'];?><?php  if($v['size']) { ?>(<?php  echo $v['size'];?>)<?php  } ?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">关联的数据类型</label>
                    <div class="col-sm-9 col-xs-12">
                        <select class="form-control" name="data_type" id="data_type">
                            <option value="">请选择</option>
                            <?php  if(is_array($dataTypes)) { foreach($dataTypes as $k => $v) { ?>
                            <option value="<?php  echo $k;?>"<?php  if($item['data_type']==$k) { ?> selected=""<?php  } ?>><?php  echo $v;?></option>
                            <?php  } } ?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">样式名称</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.nav' ,$item) ) { ?>
                        	<input type="text" id='classname' name="classname" class="form-control" value="<?php  echo $item['classname'];?>" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['classname'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">导航链接</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('shop.nav' ,$item) ) { ?>
	                        <div class="input-group form-group" style="margin: 0;">
								<input type="text" value="<?php  echo $item['url'];?>" class="form-control valid" name="url" placeholder="" id="navlink">
								<span data-input="#navlink" data-toggle="selectUrl" class="input-group-addon btn btn-default">选择链接</span>
							</div>
                        <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['url'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">tabBar页面</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.nav' ,$item) ) { ?>
	                        <label class='radio-inline'>
	                            <input type='radio' name='istab' value='1' <?php  if($item['istab']==1) { ?>checked<?php  } ?> /> 是
	                        </label>
	                        <label class='radio-inline'>
	                            <input type='radio' name='istab' value='0' <?php  if($item['istab']==0) { ?>checked<?php  } ?> /> 否
	                        </label>
                            <span class='help-block'>针对于小程序而言</span>
	                    <?php  } else { ?>
                            <div class='form-control-static'><?php  if(empty($item['istab'])) { ?>是<?php  } else { ?>否<?php  } ?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.nav' ,$item) ) { ?>
	                        <label class='radio-inline'>
	                            <input type='radio' name='status' value=1' <?php  if($item['status']==1) { ?>checked<?php  } ?> /> 显示
	                        </label>
	                        <label class='radio-inline'>
	                            <input type='radio' name='status' value=0' <?php  if($item['status']==0) { ?>checked<?php  } ?> /> 隐藏
	                        </label>
	                    <?php  } else { ?>
                            <div class='form-control-static'><?php  if(empty($item['status'])) { ?>隐藏<?php  } else { ?>显示<?php  } ?></div>
                        <?php  } ?>
                    </div>
                </div>
            
            <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.nav' ,$item) ) { ?>
                    		<input type="submit" value="提交" class="btn btn-primary"  />
                    	<?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.nav.add|shop.nav.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#navname").isEmpty()) {
            Tip.focus("navname", "请填写导航名称!");
            return false;
        }
        return true;
    }
</script>

<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>