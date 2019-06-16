<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<div class='page-heading'>
    <span class='pull-right'>
            <?php if(cv('sale.wxcard.add')) { ?>
				 	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('sale/wxcard/add')?>"><i class='fa fa-plus'></i> 添加代金券</a>
				 	<a class='btn btn-primary btn-sm' href="<?php  echo webUrl('sale/wxcard/add',array('type'=>1))?>"><i class='fa fa-plus'></i> 添加折扣券</a>
			<?php  } ?>
    </span>
	<h2>优惠券管理 <small>总数: <span class='text-danger'><?php  echo $total;?></span> 排序数字越大越靠前显示</small></h2></div>

<form action="./index.php" method="get" class="form-horizontal table-search" role="form" id="form1">
	<input type="hidden" name="c" value="site" />
	<input type="hidden" name="a" value="entry" />
	<input type="hidden" name="m" value="ewei_shopv2" />
	<input type="hidden" name="do" value="web" />
	<input type="hidden" name="r" value="sale.wxcard" />
	<div class="page-toolbar row m-b-sm m-t-sm">
		<div class="col-sm-1">
			<div class="input-group-btn">
				<button class="btn btn-default btn-sm"  type="button" data-toggle='refresh'><i class='fa fa-refresh'></i></button>
				<?php if(cv('sale.wxcard.delete')) { ?>
					<!--<button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle='batch-remove' data-confirm="确认要删除?" data-href="<?php  echo webUrl('sale/coupon/delete')?>"><i class='fa fa-trash'></i> 删除</button>-->
				<?php  } ?>
			</div>
		</div>


		<div class="col-sm-11 pull-right">

			<select name='card_type' class='form-control  input-sm select-md'   style="width:100px;"  >
				<option value=''>类型</option>
				<option value='CASH' <?php  if($_GPC['type']=='CASH') { ?>selected<?php  } ?>>代金券</option>
				<option value='DISCOUNT' <?php  if($_GPC['type']=='DISCOUNT') { ?>selected<?php  } ?>>折扣券</option>
			</select>
			<div class="input-group">
				<input type="text" class="input-sm form-control" name='keyword' value="<?php  echo $_GPC['keyword'];?>" placeholder="卡券名称/卡券ID"> <span class="input-group-btn">

                                     <button class="btn btn-sm btn-primary" type="submit"> 搜索</button> </span>
			</div>

		</div>
	</div>
</form>

<?php  if(count($list)>0) { ?>
<table class="table table-hover table-responsive">
	<thead class="navbar-inner" >
	<tr>
		<th style="width:25px;"><input type='checkbox' /></th>
		<th style="width:180px;">卡券名称</th>
		<th style="width:180px;">卡券类型</th>
		<th style="width:180px;">总库存</th>
		<th style="width:180px;">当前库存</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<?php  if(is_array($list)) { foreach($list as $row) { ?>
	<tr>
		<td>
			<input type='checkbox'   value="<?php  echo $row['id'];?>"/>
		</td>

		<td><?php  echo $row['title'];?>
		</td>
		<td>
			<?php  if($row['card_type']=="CASH") { ?> 代金券<?php  } else if($row['card_type']=="DISCOUNT") { ?>折扣券 <?php  } ?>
		</td>
		<td>
			<?php  echo $row['total_quantity'];?>
		</td>
		<td>
			<?php  echo $row['quantity'];?>
		</td>
		<td  style="overflow:visible;">
			<div class="btn-group btn-group-sm" >
				<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" href="javascript:;">操作 <span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-left" role="menu" style='z-index: 9999'>

					<?php if(cv('sale.wxcard.edit')) { ?>
					<li><a  href="<?php  echo webUrl('sale/wxcard/edit',array('id' => $row['id']));?>"><i class='fa fa-edit'></i> <?php if(cv('sale.wxcard.edit')) { ?>编辑<?php  } else { ?>查看<?php  } ?></a></li>
					<?php  } ?>
					<?php if(cv('sale.wxcard.delete')) { ?>
					<li><a  data-toggle='ajaxRemove' href="<?php  echo webUrl('sale/wxcard/delete',array('id' => $row['id']));?>" data-confirm="确定要删除该微信卡券吗？"><i class='fa fa-trash'></i> 删除</a></li>
					<?php  } ?>

					<?php if(cv('sale.wxcard.stock')) { ?><li><a data-toggle="ajaxModal" href="<?php  echo webUrl('sale/wxcard/stock', array('id'=>$row['id'],'card_id'=>$row['card_id']))?>" title='修改库存'><i class='fa fa-credit-card'></i> 修改库存</a></li><?php  } ?>
					<?php if(cv('sale.wxcard.qrcode')) { ?><li><a data-toggle="ajaxModal" href="<?php  echo webUrl('sale/wxcard/qrcode', array('id'=>$row['id'],'card_id'=>$row['card_id']))?>"   title='下载推送二维码'><i class='fa fa-download'></i> 下载推送二维码</a></li><?php  } ?>
				</ul>
			</div>
		</td>
	</tr>
	<?php  } } ?>
	</tbody>

</table>
<?php  echo $pager;?>
<?php  } else { ?>
<div class='panel panel-default'>
	<div class='panel-body' style='text-align: center;padding:30px;'>
		暂时没有任何优惠券!
	</div>
</div>
<?php  } ?>
</form>
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>