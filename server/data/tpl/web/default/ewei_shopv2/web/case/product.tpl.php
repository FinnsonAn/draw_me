<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class="page-heading"> 
    <span class='pull-right'>
        <?php if(cv('case.product.add')) { ?>
        	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('case/product/add')?>"><i class='fa fa-plus'></i> 添加作品</a>
        <?php  } ?>
    </span>
    <h2>作品管理</h2> 
</div>

<form action="./index.php" method="get" class="form-horizontal  ">
    <input type="hidden" name="c" value="site" />
    <input type="hidden" name="a" value="entry" />
    <input type="hidden" name="m" value="ewei_shopv2" />
       <input type="hidden" name="do" value="web" />
    <input type="hidden" name="r"  value="case.product" />
    <div class="page-toolbar row m-b-sm m-t-sm">
        <div class="col-sm-4">

            <div class="input-group-btn">
                <button class="btn btn-default btn-sm"  type="button" data-toggle='refresh'><i class='fa fa-refresh'></i></button>
                <?php if(cv('case.product.edit')) { ?>
	                <button class="btn btn-default btn-sm" type="button" data-toggle='batch' data-href="<?php  echo webUrl('case/product/status',array('status'=>1, 'cid' => $cid))?>"><i class='fa fa-circle'></i> 显示</button>
	                <button class="btn btn-default btn-sm" type="button" data-toggle='batch'  data-href="<?php  echo webUrl('case/product/status',array('status'=>0, 'cid' => $cid))?>"><i class='fa fa-circle-o'></i> 隐藏</button>
                <?php  } ?>
                <?php if(cv('case.product.delete')) { ?>	
                	<button class="btn btn-default btn-sm" type="button" data-toggle='batch-remove' data-confirm="确认要删除?" data-href="<?php  echo webUrl('case/product',array('op'=>'delete', 'cid' => $cid))?>"><i class='fa fa-trash'></i> 删除</button>
                <?php  } ?>


            </div> 
        </div>	


        <div class="col-sm-6 pull-right">

            <select name="status" class='form-control input-sm select-sm'>
                <option value="" <?php  if($_GPC['status'] == '') { ?> selected<?php  } ?>>状态</option>
                <option value="1" <?php  if($_GPC['status']== '1') { ?> selected<?php  } ?>>显示</option>
                <option value="0" <?php  if($_GPC['status'] == '0') { ?> selected<?php  } ?>>隐藏</option>
            </select>	
            <select name='position_id' class='form-control input-sm select-sm' style="width:150px;">
              <option value="">
                分类
              </option>
                <?php  if(is_array($cates)) { foreach($cates as $v) { ?>
                <option value="<?php  echo $v['id'];?>"<?php  if($item['cate']==$v['id'] || $cid==$v['id'] ) { ?> selected=""<?php  } ?>><?php  echo $v['name'];?></option>
                <?php  } } ?>
            </select>
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
        <thead class="navbar-inner">
            <tr>
                <th style="width:25px;" ><input type='checkbox' /></th>
                <th style="width:25px;" >ID</th>
                <th style='width:120px'>分类</th>					
                <th class='th-sortable' data-sort-name='title'>作品标题</th>
                <th>作者</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>

        <tbody>
            <?php  if(is_array($list)) { foreach($list as $row) { ?>
            <tr>
                <td>
                    <input type='checkbox'   value="<?php  echo $row['id'];?>"/>
                </td>
                <td>
                    <?php  echo $row['id'];?>
                </td>
                <td>     
                	<?php  echo $row['category'];?>
                </td>
                <td><?php  echo $row['title'];?></td>
                <td><?php  echo $row['author'];?></td>
                <td>
                    <span class='label <?php  if($row['enabled']==1) { ?>label-success<?php  } else { ?>label-default<?php  } ?>' 
                          <?php if(cv('case.product.edit')) { ?>
	                          data-toggle='ajaxSwitch' 
	                          data-switch-value='<?php  echo $row['enabled'];?>'
	                          data-switch-value0='0|隐藏|label label-default|<?php  echo webUrl('case/product/enabled',array('enabled'=>1,'id'=>$row['id']))?>'  
	                          data-switch-value1='1|显示|label label-success|<?php  echo webUrl('case/product/enabled',array('enabled'=>0,'id'=>$row['id']))?>'  
                          <?php  } ?>>
                          <?php  if($row['enabled']==1) { ?>显示<?php  } else { ?>隐藏<?php  } ?></span>

                    </td>
                    <td style="text-align:left;">
                        <?php if(cv('case.product.view|case.product.edit')) { ?>
                        	<a href="<?php  echo webUrl('case/product/edit',array('id' => $row['id']))?>" class="btn btn-default btn-sm" >
                        		<i class='fa fa-edit'></i> <?php if(cv('case.product.edit')) { ?>修改<?php  } else { ?>查看<?php  } ?>
                        	</a>
                        <?php  } ?>
                        <?php if(cv('case.product.delete')) { ?>
                        	<a data-toggle='ajaxRemove' href="<?php  echo webUrl('case/product/deleted', array('id' => $row['id']))?>"class="btn btn-default btn-sm" data-confirm='确认要删除此作品吗?'><i class="fa fa-trash"></i> 删除</a>
                        <?php  } ?>
                    </td>
                </tr>
                <?php  } } ?>
                <tr>
                    <td colspan='6'>
                        <div class='pagers' style='float:right;'>
                            <?php  echo $pager;?>			
                        </div>
                    </td>
                </tr>
            </tbody>

        </table>

        <?php  } else { ?>
        <div class='panel panel-default'>
            <div class='panel-body' style='text-align: center;padding:30px;'>
                暂时没有任何作品!
            </div>
        </div><?php  } ?>
    </form>

    <?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>