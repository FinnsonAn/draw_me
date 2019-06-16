<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<?php  if(!$_W['method']) { ?>
<div class="page-heading"> 
    <span class='pull-right'>
        <?php if(cv('shop.section.add')) { ?>
        	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('shop/section/edit')?>"><i class='fa fa-plus'></i> 添加版块</a>
        <?php  } ?>
    </span>
    <h2>版块管理</h2> 
</div>
<form action="./index.php" method="get" class="form-horizontal form-search" role="form">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
    <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r"  value="shop.section.plist" />
</form>

<form action="" method="post">
    <?php  if(count($list)>0) { ?>
    <table class="table table-responsive table-hover" >
         <tr>
            <th style="width:50px;">ID</th>	
            <th style='width:80px'>显示顺序</th>	
            <th>版块</th>
            <th>标题</th>
            <th>类型</th>
            <th>包含图位</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <tbody>
                <?php  if(is_array($list)) { foreach($list as $row) { ?>
                <tr>
                    <td><?php  echo $row['sid'];?></td>
                    <td><?php if(cv('shop.section.edit')) { ?>
                    	<a href='javascript:;' data-toggle='ajaxEdit' data-href="<?php  echo webUrl('shop/section/displayorder',array('id'=>$row['sid']))?>" ><?php  echo $row['displayorder'];?></a>
                    <?php  } else { ?>
                    	<?php  echo $row['displayorder'];?> 
                    <?php  } ?></td>
                    <td><?php  echo $row['section_name'];?></td>
                    <td><?php  echo $row['section_title'];?></td>
                    <td><span class='label label-success'><?php  echo $row['type'];?></span></td>
                    <td><a href="<?php  echo webUrl('shop/section/album', array('sid' => $row['sid']))?>" class="btn btn-default btn-sm" title="查看图位">查看图位(<?php  echo $row['counts'];?>)</a></td>
                    <td>
                                    <?php  if($row['enabled']==1) { ?>
                                    <span class='label label-success'>显示</span>
                                    <?php  } else { ?>
                                    <span class='label label-danger'>隐藏</span>
                                    <?php  } ?>
                    </td>
                    <td style="text-align:left;">
                        <?php if(cv('shop.section.view|shop.section.edit')) { ?>
                        &nbsp; 
                        <a href="<?php  echo webUrl('shop/section/edit', array('id' => $row['sid']))?>" class="btn btn-default btn-sm" title="<?php if(cv('shop.section.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>"><i class="fa fa-edit"></i></a><?php  } ?>
                        <?php  if(!$row['is_system']) { ?><?php if(cv('shop.section.delete')) { ?><a data-toggle='ajaxRemove' href="<?php  echo webUrl('shop/section/delete', array('id' => $row['sid']))?>" class="btn btn-default btn-sm" data-confirm='确认删除此版块吗，连同包括的也会一起删除?'><i class="fa fa-times"></i></a><?php  } ?><?php  } ?>
                    </td>
                </tr>
                <?php  } } ?> 
                <tr>
                    <td colspan='8'>
                        <?php if(cv('shop.section.add')) { ?>
                          <a class='btn btn-primary' href="<?php  echo webUrl('shop/section/edit')?>"><i class='fa fa-plus'></i> 添加版块</a>
                       <?php  } ?>
                    </td>
                </tr>
            </tbody>
        </table>
        <?php  } else { ?>
        <div class='panel panel-default'>
            <div class='panel-body' style='text-align: center;padding:30px;'>
                暂时没有任何版块!
            </div>
        </div>
        <?php  } ?>
    </form>

<?php  } else if($_W['method'] == 'edit') { ?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('shop.section.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('shop/section/edit')?>">添加新版块</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('shop/section')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['sid'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>版块 <small><?php  if(!empty($item['sid'])) { ?>修改【<?php  echo $item['section_name'];?>】<?php  } ?></small></h2> 
</div>
 
    <form <?php if( ce('shop.section' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['sid'];?>" />
         		<div class="form-group">
                    <label class="col-sm-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('shop.section' ,$item) ) { ?>
                                <input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                                <span class='help-block'>数字越大，排名越靠前</span>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">版块名称</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        	<input type="text" id='section_name' name="section_name" class="form-control" value="<?php  echo $item['section_name'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['section_name'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">版块标题</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
	                        <input type="text" id='section_title' name="section_title" class="form-control" value="<?php  echo $item['section_title'];?>" />
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['size'];?></div>
                        <?php  } ?>
                    </div>
                </div>
               <div class="form-group">
                    <label class="col-sm-2 control-label">版块类型</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        <select class="form-control" name="section_type" id="section_type">
                            <option value="">请选择</option>
                            <?php  if(is_array($section_types)) { foreach($section_types as $k => $val) { ?>
                            <option value="<?php  echo $k;?>" <?php  if($k == $item['section_type']) { ?>selected=""<?php  } ?>><?php  echo $val;?></option>
                            <?php  } } ?>
                        </select>
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['section_type'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">版块样式(Wap端)</label>
                    <div class="col-sm-9 col-xs-12">
                         <?php if( ce('shop.section' ,$item) ) { ?>
                        <select class="form-control" name="style" id="style">
                            <option value="">请选择</option> 
                            <?php  if(is_array($styles)) { foreach($styles as $k => $style) { ?>
                            <option value="<?php  echo $k;?>" <?php  if($k == $item['style']) { ?>selected<?php  } ?>><?php  echo $style;?></option>
                            <?php  } } ?>
                        </select>
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo m('shop')->getSectionStyle($item['style'])?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">链接地址</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='link' name="link" class="form-control" value="<?php  echo $item['link'];?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">关联的幻灯片ID</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='slider_id' name="slider_id" class="form-control" value="<?php  echo $item['slider_id'];?>" />
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">样式名(css)</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='classname' name="classname" class="form-control" value="<?php  echo $item['classname'];?>" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">背景颜色</label>
                    <div class="col-sm-9 col-xs-12">
                        <input type="text" id='bgcolor' name="bgcolor" class="form-control" value="<?php  echo $item['bgcolor'];?>" />
                        <div class='form-control-static'><span class="color-box" <?php  if($item['bgcolor']) { ?>style='background:<?php  echo $item['bgcolor'];?>'<?php  } ?>></span></div>
 
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
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
            
            <div class="form-group">
                    <label class="col-sm-2 control-label"></label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.section' ,$item) ) { ?>
                    		<input type="submit" value="提交" class="btn btn-primary"  />
                    	<?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.section.add|shop.section.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#section_name").isEmpty()) {
            Tip.focus("section_name", "请填写版块名称!");
            return false;
        }
        return true;
    }
	
	$(function(){
	    $('#bgcolor').blur(function(){
			var $color = $(this).val();
			if ($color != '')
			{
				$('.color-box').css("background", $color);
			}
			else
			{
				$('.color-box').css("background", "#fff");
			}
		});	
	});
</script>
<?php  } ?>
    <?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>