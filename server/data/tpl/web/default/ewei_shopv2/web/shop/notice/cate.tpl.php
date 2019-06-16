<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<?php  if($_W['method'] == 'catelist') { ?>
<div class="page-heading"> 
    <span class='pull-right'>
        <?php if(cv('shop.notice.add')) { ?>
        	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('shop/notice/cateedit')?>"><i class='fa fa-plus'></i> 添加分类</a>
        <?php  } ?>
    </span>
    <h2>分类管理</h2> 
</div>
<form action="./index.php" method="get" class="form-horizontal form-search" role="form">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
    <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r"  value="shop.notice.catelist" />
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
            <th>显示顺序</th>			
            <th>分类名称</th>
            <th>包含文章</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <tbody>
                <?php  if(is_array($list)) { foreach($list as $row) { ?>
                <tr>
                    <td><?php  echo $row['id'];?></td>
                    <td>
                        <?php if(cv('shop.notice.edit')) { ?>
                           <input type="text" class="form-control" name="displayorder[<?php  echo $row['id'];?>]" value="<?php  echo $row['displayorder'];?>">
                        <?php  } else { ?>
                           <?php  echo $row['displayorder'];?>
                        <?php  } ?>
                    </td>
                    <td><?php  if($row['is_system']) { ?><span class='label label-danger'>系统保护</span><?php  } ?><?php  echo $row['title'];?></td>
                    <td><a href="<?php  echo webUrl('shop/notice', array('cid' => $row['id']))?>" class="btn btn-default btn-sm" title="查看文章">查看文章(<?php  echo $row['counts'];?>)</a></td>
                    <td>
                                    <?php  if($row['enabled']==1) { ?>
                                    <span class='label label-success'>显示</span>
                                    <?php  } else { ?>
                                    <span class='label label-danger'>隐藏</span>
                                    <?php  } ?>
                    </td>
                    <td style="text-align:left;">
                        <?php if(cv('shop.notice.view|shop.notice.edit')) { ?>
                        &nbsp; 
                        <a href="<?php  echo webUrl('shop/notice/cateedit', array('id' => $row['id']))?>" class="btn btn-default btn-sm" title="<?php if(cv('shop.notice.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>"><i class="fa fa-edit"></i></a><?php  } ?>
                        <?php  if(!$row['is_system']) { ?><?php if(cv('shop.notice.delete')) { ?><a data-toggle='ajaxRemove' href="<?php  echo webUrl('shop/notice/catedel', array('id' => $row['id']))?>" class="btn btn-default btn-sm" data-confirm='确认删除此分类吗，连同包括的也会一起删除?'><i class="fa fa-times"></i></a><?php  } ?><?php  } ?>
                    </td>
                </tr>
                <?php  } } ?> 
                <tr>
                    <td colspan='6'>
                        <?php if(cv('shop.notice.add')) { ?>
                          <a class='btn btn-primary' href="<?php  echo webUrl('shop/notice/cateedit')?>"><i class='fa fa-plus'></i> 添加分类</a>
                       <?php  } ?>
                    </td>
                </tr>
            </tbody>
        </table>
        <?php  } else { ?>
        <div class='panel panel-default'>
            <div class='panel-body' style='text-align: center;padding:30px;'>
                暂时没有任何分类!
            </div>
        </div>
        <?php  } ?>
    </form>

<?php  } else if($_W['method'] == 'cateedit') { ?>
<div class="page-heading"> 
	<span class='pull-right'>
		<?php if(cv('shop.notice.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('shop/notice/cateedit')?>">添加分类</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('shop/notice/catelist')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>分类 <small><?php  if(!empty($item['id'])) { ?>修改【<?php  echo $item['title'];?>】<?php  } ?></small></h2> 
</div>
 
    <form <?php if( ce('shop.notice' ,$item) ) { ?>action="" method="post"<?php  } ?> class="form-horizontal form-validate" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?php  echo $item['id'];?>" />
       			 <div class="form-group">
                    <label class="col-xs-12 col-sm-3 col-md-2 control-label">排序</label>
                    <div class="col-sm-9 col-xs-12">
                        <?php if( ce('shop.notice' ,$item) ) { ?>
                                <input type="text" name="displayorder" class="form-control" value="<?php  echo $item['displayorder'];?>" />
                                <span class='help-block'>数字越大，排名越靠前</span>
                        <?php  } else { ?>
                            <div class='form-control-static'><?php  echo $item['displayorder'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label must">分类名称</label>
                    <div class="col-sm-9 col-xs-12 ">
                         <?php if( ce('shop.notice' ,$item) ) { ?>
                        	<input type="text" id='title' name="title" class="form-control" value="<?php  echo $item['title'];?>" data-rule-required="true" />
                         <?php  } else { ?>
                        	<div class='form-control-static'><?php  echo $item['title'];?></div>
                        <?php  } ?>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">状态</label>
                    <div class="col-sm-9 col-xs-12">
                    	<?php if( ce('shop.notice' ,$item) ) { ?>
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
                    	<?php if( ce('shop.notice' ,$item) ) { ?>
                    		<input type="submit" value="提交" class="btn btn-primary"  />
                    	<?php  } ?>
                       <input type="button" name="back" onclick='history.back()' <?php if(cv('shop.notice.add|shop.notice.edit')) { ?>style='margin-left:10px;'<?php  } ?> value="返回列表" class="btn btn-default" />
                    </div>
            </div>
 
    </form>
 

<script language='javascript'>
    function formcheck() {
        if ($("#title").isEmpty()) {
            Tip.focus("title", "请填写分类名称!");
            return false;
        }
        return true;
    }
</script>
<?php  } ?>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>