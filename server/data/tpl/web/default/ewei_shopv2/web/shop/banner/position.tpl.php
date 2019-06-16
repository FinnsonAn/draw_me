<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<?php  if($_W['method'] == 'plist') { ?>
<div class="page-heading"> 
    <span class='pull-right'>
        <?php if(cv('shop.banner.add')) { ?>
        	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('shop/banner/pedit')?>"><i class='fa fa-plus'></i> 添加位置</a>
        <?php  } ?>
    </span>
    <h2>广告位管理</h2> 
</div>
<form action="./index.php" method="get" class="form-horizontal form-search" role="form">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
    <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r"  value="shop.banner.plist" />
    <div class="page-toolbar row m-b-sm m-t-sm">
              <div class="col-sm-6 pull-right">
	
            <div class="input-group">				 
                <input type="text" class="input-sm form-control" name='keyword' value="<?php  echo $_GPC['keyword'];?>" placeholder="请输入关键词"> 
                <span class="input-group-btn">
                	<button class="btn btn-sm btn-primary" type="submit"> 搜索</button> 
                </span>
            </div>
        </div>
        
    </div>
</form>

<form action="" method="post">
    <?php  if(count($list)>0) { ?>
    <table class="table table-responsive table-hover" >
         <tr>
            <th style="width:50px;">ID</th>		
            <th>位置名称</th>
            <th>尺寸</th>
            <th>描述</th>
            <th>包含广告数量</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <tbody>
                <?php  if(is_array($list)) { foreach($list as $row) { ?>
                <tr>
                    <td><?php  echo $row['pid'];?></td>
                    <td><?php  if($row['is_system']) { ?><span class='label label-danger'>系统</span><?php  } ?><?php  echo $row['position_name'];?></td>
                    <td><?php  echo $row['size'];?></td>
                    <td><?php  echo $row['desc'];?></td>
                    <td><?php if(cv('shop.banner.view')) { ?><a href="<?php  echo webUrl('shop/banner', array('position_id' => $row['pid']))?>" class="btn btn-default btn-sm" title="查看广告">查看广告(<?php  echo $row['counts'];?>)</a><?php  } ?></td>
                    <td>
                                    <?php  if($row['enabled']==1) { ?>
                                    <span class='label label-success'>显示</span>
                                    <?php  } else { ?>
                                    <span class='label label-danger'>隐藏</span>
                                    <?php  } ?>
                    </td>
                    <td style="text-align:left;">
                        <?php if(cv('shop.banner.view|shop.banner.edit')) { ?>
                        &nbsp; 
                        <a href="<?php  echo webUrl('shop/banner/pedit', array('id' => $row['pid']))?>" class="btn btn-default btn-sm" title="<?php if(cv('shop.banner.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>"><i class="fa fa-edit"></i></a><?php  } ?>
                         <?php  if(!$row['is_system']) { ?><?php if(cv('shop.banner.delete')) { ?><a data-toggle='ajaxRemove' href="<?php  echo webUrl('shop/banner/pdelete', array('id' => $row['pid']))?>" class="btn btn-default btn-sm" data-confirm='确认删除此位置吗，连同包括的广告也会一起删除?'><i class="fa fa-times"></i></a><?php  } ?><?php  } ?>
                    </td>
                </tr>
                <?php  } } ?> 
                <tr>
                    <td colspan='7'>
                        <?php if(cv('shop.banner.add')) { ?>
                          <a class='btn btn-primary' href="<?php  echo webUrl('shop/banner/pedit')?>"><i class='fa fa-plus'></i> 添加位置</a>
                       <?php  } ?>
                    </td>
                </tr>
            </tbody>
        </table>
        <?php  } else { ?>
        <div class='panel panel-default'>
            <div class='panel-body' style='text-align: center;padding:30px;'>
                暂时没有任何广告位置!
            </div>
        </div>
        <?php  } ?>
    </form>

<?php  } else if($_W['method'] == 'pedit') { ?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('shop.banner.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('shop/banner/pedit')?>">添加新位置</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('shop/banner/plist')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['pid'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>位置 <small><?php  if(!empty($item['pid'])) { ?>修改【<?php  echo $item['position_name'];?>】<?php  } ?></small></h2> 
</div>
 
    <form <?php if( ce('shop.banner' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['pid'];?>" />
                <div class="form-group">
                    <label class="col-sm-2 control-label must">位置名称</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.banner' ,$item) ) { ?>
                        	<input type="text" id='position_name' name="position_name" class="form-control" value="<?php  echo $item['position_name'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['position_name'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">尺寸</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.banner' ,$item) ) { ?>
	                        <input type="text" id='size' name="size" class="form-control" value="<?php  echo $item['size'];?>" />
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['size'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">描述</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.banner' ,$item) ) { ?>
                        <input type="text" id='desc' name="desc" class="form-control" value="<?php  echo $item['desc'];?>" />
                         <?php  } else { ?>
                        <div class='form-control-static'><?php  echo $item['desc'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.banner' ,$item) ) { ?>
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
                    	<?php if( ce('shop.banner' ,$item) ) { ?>
                    		<input type="submit" value="提交" class="btn btn-primary"  />
                    	<?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.banner.add|shop.banner.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#position_name").isEmpty()) {
            Tip.focus("position_name", "请填写位置名称!");
            return false;
        }
        return true;
    }
</script>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>