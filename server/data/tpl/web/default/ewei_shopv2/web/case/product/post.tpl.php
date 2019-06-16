<?php defined('IN_IA') or exit('Access Denied');?><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_header', TEMPLATE_INCLUDEPATH)) : (include template('_header', TEMPLATE_INCLUDEPATH));?>
<style>
    .spec_item_thumb {position: relative;width: 30px;height: 20px;padding: 0;border-left: none;}
    .spec_item_thumb img{cursor: pointer;}
</style>
<div class="page-heading">
	<span class='pull-right'>
		<?php if(cv('case.product.add')) { ?>
			<a class="btn btn-primary btn-sm" href="<?php  echo webUrl('case/product/add')?>">添加新作品</a>
		<?php  } ?>
		<a class="btn btn-default  btn-sm" href="<?php  echo webUrl('case/product')?>">返回列表</a>
	</span>
	<h2><?php  if(!empty($item['id'])) { ?>编辑<?php  } else { ?>添加<?php  } ?>作品
    </h2>
</div>
<div class="alert alert-danger">注意：为保证数据的准确性，作品类型跟活动类型保存后将不可更改，请谨慎选择。</div>
    <form id="dataform" action="" method="post" class="form-horizontal form-validate">
        <input type='hidden' id='tab' name='tab' value="<?php  echo $_GPC['tab'];?>" />
       <ul class="nav nav-arrow-next nav-tabs" id="myTab">
            <li <?php  if($_GPC['tab']=='basic' || empty($_GPC['tab'])) { ?>class="active"<?php  } ?> ><a href="#tab_basic">基本</a></li>
            <li <?php  if($_GPC['tab']=='param') { ?>class="active"<?php  } ?>><a href="#tab_option">参数</a></li>
            <li <?php  if($_GPC['tab']=='content') { ?>class="active"<?php  } ?>><a href="#tab_notice">详情</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane <?php  if($_GPC['tab']=='basic' || empty($_GPC['tab'])) { ?>active<?php  } ?>" id="tab_basic"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('case/product/basic', TEMPLATE_INCLUDEPATH)) : (include template('case/product/basic', TEMPLATE_INCLUDEPATH));?></div>
            <div class="tab-pane <?php  if($_GPC['tab']=='param') { ?>active<?php  } ?>" id="tab_option"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('case/product/param', TEMPLATE_INCLUDEPATH)) : (include template('case/product/param', TEMPLATE_INCLUDEPATH));?></div>
            <div class="tab-pane <?php  if($_GPC['tab']=='content') { ?>active<?php  } ?>" id="tab_notice"><?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('case/product/content', TEMPLATE_INCLUDEPATH)) : (include template('case/product/content', TEMPLATE_INCLUDEPATH));?></div>
        </div>
        <div class="form-group-title"></div>
        <div class="form-group"></div>
        <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-9 col-xs-12">
                <?php if( ce('case.product' ,$item) ) { ?>
                    <input type="submit"  value="提交" class="btn btn-primary pull-right" />
                <?php  } ?>
            </div>
        </div>
 </form>
<script language='javascript'>
    require(['bootstrap'],function(){
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $('#tab').val( $(this).attr('href'));
            $(this).tab('show');
        })
    });
</script>




        <script type="text/javascript">
            //  new script
            $(function () {
                require(['bootstrap'],function(){
                    $('#myTab a').click(function (e) {
                        e.preventDefault();
                        $('#tab').val( $(this).attr('href'));
                        $(this).tab('show');
                    })
                });

                $("input[name='goodstype']").unbind('click').click(function () {
                    var val = $(this).val();
                    if(parseInt(val)>0){
                        $("#hasoption-goup").hide();
                    }else{
                        $("#hasoption-goup").show();
                    }
                    $(".cgt").hide();
                    $(".cgt-"+val).show();
                });
            })
        </script>
 
<?php (!empty($this) && $this instanceof WeModuleSite || 1) ? (include $this->template('_footer', TEMPLATE_INCLUDEPATH)) : (include template('_footer', TEMPLATE_INCLUDEPATH));?>
 